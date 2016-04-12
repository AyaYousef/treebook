require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "the /login route that opens the login page" do
    get "/login"
    assert_response :success
  end

  test "the /logout route that opens the logout page" do
    get "/logout"
    assert_response :redirect
    assert_redirected_to '/'
  end

  test "the /signup route that opens the signup page" do
    get "/signup"
    assert_response :success
  end

  test "profile page is working" do
    get "youta"
    assert_response :success
  end
end
