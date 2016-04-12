require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:aya).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render 404 profile page not found" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end

  test "variables are assigned on successful profile viewing" do
    get :show, id: users(:aya).profile_name
    # Add an assertion to check that the 'user' controller instance variable exists.
    assert assigns(:user)
    # Add an assertion to check that the 'statuses' controller instance variable is not empty.
    assert_not_empty assigns(:statuses)
  end

  test "only show the correct user's statuses" do
    get :show, id: users(:aya).profile_name
    assigns(:statuses).each do |status|
      assert_equal users(:aya), status.user
    end
  end

end
