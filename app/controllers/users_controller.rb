class UsersController < ApplicationController
  before_action :require_sign_in

  def show
    if current_user
      @user = params[:id] ? User.find(params[:id]) : current_user
      @topics = @user.topics
      @liked_bookmarks = @user.likes.map(&:bookmark)
    else
      redirect_to new_user_registration_path
    end
  end

  def new
  end

  def index
    @user = User.find(params[:id])
    @bookmarks = @user.topic.bookmarks
  end

end
