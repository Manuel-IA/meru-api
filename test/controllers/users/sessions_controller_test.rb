require 'test_helper'

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:default_user)
  end

  test "should log in with valid credentials" do
    post user_session_url, params: { user: { email: @user.email, password: 'password123' } }, as: :json
    assert_response :success
    @jwt_token = response.headers['Authorization']
    assert_not_nil @jwt_token
  end

  test "should not log in with invalid credentials" do
    post user_session_url, params: { user: { email: @user.email, password: 'wrongpassword' } }, as: :json
    assert_response :unauthorized
  end

  test "should log out successfully" do
    post user_session_url, params: { user: { email: @user.email, password: 'password123' } }, as: :json
    assert_response :success
    jwt_token = response.headers['Authorization']
    assert_not_nil jwt_token

    delete destroy_user_session_url, headers: { 'Authorization' => jwt_token }, as: :json
    assert_response :success
  end

  test "should return unauthorized if trying to log out without being logged in" do
    delete destroy_user_session_url, as: :json
    assert_response :unauthorized
    response_body = JSON.parse(response.body)
    assert_equal "Log out failed!", response_body["message"]
  end
end
