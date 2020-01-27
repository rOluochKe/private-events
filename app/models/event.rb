# frozen_string_literal: true

class Event < ApplicationRecord
  scope :past_events, lambda {
                        where('date < ?', DateTime.current)
                          .order(date: :desc)
                      }
  scope :upcoming_events, lambda {
                            where('date >= ?', DateTime.current)
                              .order(date: :asc)
                          }

  belongs_to :creator,       class_name: 'User'

  has_many  :attendances,    class_name: 'Attendance',
                             foreign_key: 'attended_event_id',
                             dependent: :destroy
  has_many  :attendees, through: :attendances, source: :attendee
  validates :creator_id, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true

  def upcoming?
    date&.future?
  end

  def attendee?(user)
    attendees.include? user
  end
end
