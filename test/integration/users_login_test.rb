# frozen_string_literal: true

require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information followed by logout' do
    get login_path
    post login_path, params: { session: { email: @michael.email } }
    assert logged_in?
    assert_redirected_to user_path(@michael)
    follow_redirect!
    assert_template 'users/show'
    delete logout_path
    assert_not logged_in?
    assert_redirected_to root_path
  end

  test 'login with remembering' do
    log_in_as(@michael)
    assert_not_empty cookies[:remember_token]
  end
end
