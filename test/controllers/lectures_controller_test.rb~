require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  setup do
    @lecture = lectures(:one)
    
  end


  test "should get index" do
    get :showrelated, id: @lecture.course_id
    assert_response :success
    #assert_not_nil assigns(:lectures)
  end

  
end
