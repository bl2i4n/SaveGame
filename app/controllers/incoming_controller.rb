class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by(email: params[:sender])

    if user
      topic = user.topics.find_or_create_by(title: params[:subject])
      bookmark = topic.bookmarks.find_or_create_by(url: params['stripped-text'])

      head 200
    else
      head 404
    end
  end
end
