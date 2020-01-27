# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests
  # in alphabetical order.
  include ApplicationHelper
  fixtures :all
  # Returns true if a test user is logged in
  def logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  # Log in as a particular user
  def log_in_as(user)
    post login_path, params: { session: { email: user.email } }
  end
end
