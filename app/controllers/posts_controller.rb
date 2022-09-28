class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @profile = User.find(current_user.id)
    @invites_received = Invitation.invites_received(current_user)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def post_params
    params.require(:post).permit(:body)
  end

end
