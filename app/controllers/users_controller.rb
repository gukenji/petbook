class UsersController < ApplicationController


  def index
    @profile = User.search(params[:name])
    @profiles = User.all.to_a.reject! { |e| e[:id] == current_user.id }
  end

  def show
    @profile = User.find(params[:id])
    @posts = @profile.posts  
    @friends = User.searchfriends(params[:id])
  end

end
