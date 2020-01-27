# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @event = @user.hosting_events.build(title: 'Poetry night',
                                        description: 'Enjoy beautiful night
                                                     with reading poetries',
                                        date: '2020-05-05',
                                        location: 'Oak caffe terrace')
  end

  test 'should be valid' do
    assert @event.valid?
  end

  test 'creator should be present' do
    @event.creator_id = nil
    assert_not @event.valid?
  end

  test 'title should be present' do
    @event.title = '   '
    assert_not @event.valid?
  end

  test 'date should be present' do
    @event.date = ' '
    assert_not @event.valid?
  end

  test 'location should be present' do
    @event.location = ' '
    assert_not @event.valid?
  end
end
