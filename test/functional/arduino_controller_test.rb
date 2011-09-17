require 'test_helper'

class ArduinoControllerTest < ActionController::TestCase
  test "should get settime" do
    get :settime
    assert_response :success
  end

  test "should get gettime" do
    get :gettime
    assert_response :success
  end

end
