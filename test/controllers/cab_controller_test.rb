require 'test_helper'

class CabControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get end_ride" do
    get :end_ride
    assert_response :success
  end

  test "should get book_cab" do
    get :book_cab
    assert_response :success
  end

end
