# frozen_string_literal: true

require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:michael)
    remember(@user)
  end

  test 'cookie test, current_user returns right user when session is nil' do
    assert_equal @user, current_user
    assert logged_in?
  end
end
