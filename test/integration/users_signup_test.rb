# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: '',
                                          email: 'user@invalid' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_not logged_in?
  end

  test 'valid signup information' do
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { name: 'Example User',
                                          email: 'user@example.com' } }
    end
    user = assigns(:user)
    assert logged_in?
  end
end
