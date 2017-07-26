class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      #need code
    else
      #need moar code
    end
  end

  def destroy
    # Get the bookmark from the params
    # Find the current user's like with the ID in the params

    if like.destroy
      # Flash success and redirect to @bookmark
    else
      # Flash error and redirect to @bookmark
    end
  end

end
