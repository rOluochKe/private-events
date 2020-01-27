# frozen_string_literal: true

require 'test_helper'

class UserHostingEventsTest < ActionDispatch::IntegrationTest
  def setup
    @michael = users(:michael)
  end

  test 'hosting events list' do
    log_in_as(@michael)
    get root_path
    # Invalid submission
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: '',
                                           description: '',
                                           date: '',
                                           location: '',
                                           creator: @michael } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    date = '2019-08-15'
    assert_difference 'Event.count', 1 do
      post events_path, params: { event: { title: 'title',
                                           description: 'description',
                                           date: date,
                                           location: 'location',
                                           creator: @michael } }
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_match '1', response.body
    assert_match 'title', response.body
    assert_match 'description', response.body
    assert_match date, response.body
    assert_match 'location', response.body
  end
end
