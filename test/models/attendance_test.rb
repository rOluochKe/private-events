# frozen_string_literal: true

require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  def setup
    @attendance = Attendance.new(attendee_id: users(:michael).id,
                                 attended_event_id: events(:archer).id)
  end

  test 'should be valid' do
    assert @attendance.valid?
  end

  test 'should require a attendee_id' do
    @attendance.attendee_id = nil
    assert_not @attendance.valid?
  end

  test 'should require a attended_event_id' do
    @attendance.attended_event_id = nil
    assert_not @attendance.valid?
  end
end
