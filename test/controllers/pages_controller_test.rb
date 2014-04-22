require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get under_construction" do
    get :under_construction
    assert_response :success
  end

end
