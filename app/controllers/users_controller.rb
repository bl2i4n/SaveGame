class UsersController < ApplicationController

  def show
    @user_topics = current_user.topics
    puts @user_topics
    all_likes = Like.where(user_id: current_user)

    bookmark_ids = []
    all_likes.each do |like|
      bookmark_ids.push(like.bookmark_id)
    end
    @liked_bookmarks = Bookmark.where(id: bookmark_ids)
    puts @liked_bookmarks
  end


end
