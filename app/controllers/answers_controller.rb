class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { redirect_to @question, notice: 'Answer cannot be blank.' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to question_url(@answer.question_id), notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { redirect_to edit_answer_path, notice: 'Updated answer cannot be blank.' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote_by current_user
    @answer.user.increase_reputation
    redirect_to :back
  end
  
  def downvote
    @answer = Answer.find(params[:id])
    @answer.downvote_by current_user
    @answer.user.decrease_reputation
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :body, :user_id)
    end
end
