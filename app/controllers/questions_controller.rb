class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    if params[:q]
      @questions = Question.search(params[:q]).order("created_at DESC")
    else
      @questions = Question.all.order("created_at DESC")
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @forum = Forum.find(params[:forum_id])
    @question = @forum.questions.new(question_params)
    @question.user = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to @forum, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { redirect_to @forum, notice: 'Question cannot be blank.' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to forum_url(@question.forum_id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to forum_url(@question.forum_id), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:forum_id, :body, :user_id)
    end
end
