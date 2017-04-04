class EnrolledCoursesController < ApplicationController
  before_action :set_enrolled_course, only: [:show, :edit, :update, :destroy]

  # GET /enrolled_courses
  # GET /enrolled_courses.json
  def index
    @enrolled_courses = EnrolledCourse.all
  end

  # GET /enrolled_courses/1
  # GET /enrolled_courses/1.json
  def show
  end

  # GET /enrolled_courses/new
  def new
    @enrolled_course = EnrolledCourse.new
  end

  # GET /enrolled_courses/1/edit
  def edit
  end

  # POST /enrolled_courses
  # POST /enrolled_courses.json
  def create
    @enrolled_course = EnrolledCourse.new(enrolled_course_params)

    respond_to do |format|
      if @enrolled_course.save
        format.html { redirect_to courses_path, notice: 'Enrolled course was successfully created.' }
        format.json { render :show, status: :created, location: @enrolled_course }
      else
        format.html { render :new }
        format.json { render json: @enrolled_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolled_courses/1
  # PATCH/PUT /enrolled_courses/1.json
  def update
    respond_to do |format|
      if @enrolled_course.update(enrolled_course_params)
        format.html { redirect_to @enrolled_course, notice: 'Enrolled course was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrolled_course }
      else
        format.html { render :edit }
        format.json { render json: @enrolled_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolled_courses/1
  # DELETE /enrolled_courses/1.json
  def destroy
    @enrolled_course.destroy
    respond_to do |format|
      format.html { redirect_to enrolled_courses_url, notice: 'Enrolled course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolled_course
      @enrolled_course = EnrolledCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrolled_course_params
      params.require(:enrolled_course).permit(:course_id, :user_id)
    end
end
