class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.all
    render :index
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
    authorize @bookmark  # user, object, controller action
    render :show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
    authorize @bookmark
    render :new
  end

  # GET /bookmarks/1/edit
  def edit
    authorize @bookmark
    render :edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = @topic.bookmarks.new(bookmark_params)
    authorize @bookmark

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to [@topic, @bookmark], notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    authorize @bookmark
    respond_to do |format|
      if @bookmark.update_attributes(bookmark_params)
        format.html { redirect_to [@topic, @bookmark], notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    authorize @bookmark
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to topic_bookmarks_path(@topic), notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end
end
