# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
  end

  test 'should show right direct link according to login status' do
    get root_path
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', signup_path # , count: 1
    assert_select 'a[href=?]', login_path, count: 1
    assert_select 'a[href=?]', logout_path, count: 0
    log_in_as @michael
    assert_redirected_to user_path(@michael)
    follow_redirect!
    assert_select 'a[href=?]', signup_path, count: 0
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path, count: 1
    # After log out, it redirect to root
    delete logout_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select 'a[href=?]', signup_path # , count: 1
    assert_select 'a[href=?]', login_path, count: 1
    assert_select 'a[href=?]', logout_path, count: 0
    # After sign up, it is login status
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { name: 'Example User',
                                          email: 'user@example.com' } }
    end
    user = assigns(:user)
    assert_redirected_to user_path(user)
    follow_redirect!
    assert_select 'a[href=?]', signup_path, count: 0
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path, count: 1
  end

  test 'should connect for create event' do
    log_in_as @michael
    get root_path
    assert_select 'nav a[href=?]', events_path
    assert_select '.main a[href=?]', events_path
    get user_path @michael
    assert_select '.main a[href=?]', events_path
  end
end
