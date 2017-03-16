require 'test_helper'

class StudentCoursesControllerTest < ActionController::TestCase
  setup do
    @student_course = student_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_course" do
    assert_difference('StudentCourse.count') do
      post :create, student_course: { course_id: @student_course.course_id, user_id: @student_course.user_id }
    end

    assert_redirected_to student_course_path(assigns(:student_course))
  end

  test "should show student_course" do
    get :show, id: @student_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_course
    assert_response :success
  end

  test "should update student_course" do
    patch :update, id: @student_course, student_course: { course_id: @student_course.course_id, user_id: @student_course.user_id }
    assert_redirected_to student_course_path(assigns(:student_course))
  end

  test "should destroy student_course" do
    assert_difference('StudentCourse.count', -1) do
      delete :destroy, id: @student_course
    end

    assert_redirected_to student_courses_path
  end
end
