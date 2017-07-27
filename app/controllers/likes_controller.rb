class LikesController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Bookmark Liked!"
    else
      flash[:alert] = "Like failed"
    end
    redirect_to [topic.bookmark. bookmark]
  end

  def destroy
    # Get the bookmark from the params
    # Find the current user's like with the ID in the params
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      # Flash success and redirect to @bookmark
      flash[:notice] = "Bookmark unfavorited."
    else
      # Flash error and redirect to @bookmark
      flash[:alert] = "Unfavoriting failed."
    end
      redirect_to [topic.bookmark. bookmark]
  end

end
