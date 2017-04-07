class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  # If the user isn't signed in, they can only see the index and show forum pages
  before_filter :authenticate_user!, except: [:index]

  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.paginate(:page => params[:page], :per_page => 6)
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
  end

  # GET /forums/new
  def new
    # gets the user that is logged in and adds their user id to the forum table
    @forum = current_user.forums.build
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  # POST /forums.json
  def create
    # gets the user that is logged in and adds their user id to the forum that was created
    @forum = current_user.forums.build(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { redirect_to new_forum_path, notice: 'Forum topic cannot be blank.' }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: 'Forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:topic)
    end
end
