# frozen_string_literal: true

require 'test_helper'

class EventsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @luna = users(:luna)
  end

  test 'event interface for unvalid / valid information' do
    log_in_as @luna
    get user_path(@luna)
    # Invalid submission
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: '',
                                           description: '',
                                           date: '',
                                           location: '',
                                           creator: @luna } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    assert_difference 'Event.count', 1 do
      post events_path, params: { event: { title: 'a',
                                           description: 'b',
                                           date: '2019-08-15',
                                           location: 'e',
                                           creator: @luna } }
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_match @luna.name, response.body
    # Delete Event
    assert_select 'a', text: 'Delete'
    newest_event = @luna.hosting_events.last
    assert_equal newest_event.creator, @luna
    assert_difference 'Event.count', -1 do
      delete event_path(newest_event)
    end
    get user_path(users(:archer))
    assert_select 'a', text: 'Delete', count: 0
  end
end
