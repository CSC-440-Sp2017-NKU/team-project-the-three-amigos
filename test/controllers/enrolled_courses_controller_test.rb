require 'test_helper'

class EnrolledCoursesControllerTest < ActionController::TestCase
  setup do
    @enrolled_course = enrolled_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrolled_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrolled_course" do
    assert_difference('EnrolledCourse.count') do
      post :create, enrolled_course: { course_id: @enrolled_course.course_id, user_id: @enrolled_course.user_id }
    end

    assert_redirected_to enrolled_course_path(assigns(:enrolled_course))
  end

  test "should show enrolled_course" do
    get :show, id: @enrolled_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enrolled_course
    assert_response :success
  end

  test "should update enrolled_course" do
    patch :update, id: @enrolled_course, enrolled_course: { course_id: @enrolled_course.course_id, user_id: @enrolled_course.user_id }
    assert_redirected_to enrolled_course_path(assigns(:enrolled_course))
  end

  test "should destroy enrolled_course" do
    assert_difference('EnrolledCourse.count', -1) do
      delete :destroy, id: @enrolled_course
    end

    assert_redirected_to enrolled_courses_path
  end
end
