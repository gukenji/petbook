class UsersController < ApplicationController


  def index
    @profile = User.search(params[:name])
  end

  def show
    @profile = User.find(params[:id])
    @posts = @profile.posts  
    @friends = User.searchfriends(params[:id])
  end

end
