# frozen_string_literal: true

class User < ApplicationRecord
  has_many  :hosting_events, class_name: 'Event',
                             foreign_key: 'creator_id',
                             dependent: :destroy

  has_many  :attendances,    class_name: 'Attendance',
                             foreign_key: 'attendee_id',
                             dependent: :destroy

  has_many  :attended_events, through:  :attendances, source: :attended_event

  validates :name,    presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email,   presence: true,
                      format: { with: VALID_EMAIL_REGEX }
  before_create :generate_token
  before_save   :downcase_email

  def generate_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def update_token
    update_attribute(:remember_token, remember_token)
  end

  def authenticated?(token)
    token == remember_token
  end

  def hosting_event?(event)
    hosting_events.include? event
  end

  def attended_event?(event)
    attended_events.include? event
  end

  def attend(event)
    attended_events.push event
  end

  def leave(event)
    attended_events.delete event
  end

  private

  # Converts email to all lower-case
  def downcase_email
    email.downcase!
  end
end
