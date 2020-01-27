# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @event = events(:michael)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Event.count' do
      post events_path, params: { title: 'title',
                                  description: 'description',
                                  date: '2019-08-15',
                                  location: 'location' }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Event.count' do
      delete event_path(@event)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong event' do
    log_in_as(users(:luna))
    event = events(:michael)
    assert_no_difference 'Event.count' do
      delete event_path(event)
    end
    assert_redirected_to root_url
  end
end
