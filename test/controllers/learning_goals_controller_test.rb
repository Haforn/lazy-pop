require 'test_helper'

class LearningGoalsControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
