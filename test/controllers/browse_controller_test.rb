require 'test_helper'

class BrowseControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

end
