# frozen_string_literal: true

require 'test_helper'

class AttendancesTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
    @event = @michael.hosting_events.first
    @luna = users(:luna)
  end

  test 'correct association for creator, attendees' do
    log_in_as @luna
    assert_difference 'Attendance.count' do
      @luna.attend @event
    end
    assert @luna.attended_event? @event
    assert @event.attendee? @luna
    # the event shows attendees
    get event_path(@event)
    assert_template 'events/show'
    assert_select '.attendees td', @luna.name
    assert_select '.attendees td', @luna.email
  end
end
