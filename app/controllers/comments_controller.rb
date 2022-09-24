class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @comments = Comment.where(post_id: @post.id)
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to new_comment_path(:id => @comment.post_id), notice: 'Comentário criado com sucesso!' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :post_id, :id, :user_id)
  end

end
