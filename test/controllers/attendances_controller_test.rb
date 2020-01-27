# frozen_string_literal: true

require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @event = events(:michael)
    @luna = users(:luna)
    @archer = users(:archer)
    @archer.attend @event
  end

  test 'create should require logged-in user' do
    assert_no_difference 'Attendance.count' do
      post attendances_path(event_id: @event.id)
    end
    assert_redirected_to login_url
  end

  test 'destroy should require logged-in user' do
    assert_no_difference 'Attendance.count' do
      delete attendances_path(event_id: @event.id)
    end
    assert_redirected_to login_url
  end
end
