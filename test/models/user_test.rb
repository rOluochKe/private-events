# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @michael = users(:michael)
    @luna = users(:archer)
  end

  test 'should be valid' do
    assert @michael.valid?
  end

  test 'name should be present' do
    @michael.name = '     '
    assert_not @michael.valid?
  end

  test 'email should be present' do
    @michael.email = '     '
    assert_not @michael.valid?
  end

  test 'associated events should be destroyed' do
    events_count = @michael.hosting_events.count
    assert_difference 'Event.count', -events_count do
      @michael.destroy
    end
  end

  test 'should attend and leave an event' do
    @event = @luna.hosting_events.build(title: 'title',
                                        description: 'description',
                                        date: '2019-08-15',
                                        location: 'location')
    assert_not @michael.attended_event? @event
    @michael.attend @event
    assert @michael.attended_event? @event
    assert @event.attendees.include? @michael
    @michael.leave @event
    assert_not @michael.attended_event? @event
  end
end
