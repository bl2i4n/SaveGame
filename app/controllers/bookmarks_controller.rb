class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @bookmark = Bookmark.new
    authorize @bookmark
    @bookmark.url = params[:bookmark][:url]
    @bookmark.description = params[:bookmark][:description]
    @topic = Topic.find(params[:topic_id])

    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the bookmark.  Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.url = params[:bookmark][:url]
    @bookmark.description = params[:bookmark][:description]

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the bookmark.  Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      render :show
    end
  end
end
