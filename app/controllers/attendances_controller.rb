# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :logged_in_user

  def attend
    @event = Event.find(params[:event_id])
    current_user.attend @event
    flash[:success] = 'Successfully attended event'
    redirect_back(fallback_location: @event)
  end

  def leave
    @event = Event.find(params[:event_id])
    current_user.leave @event
    flash[:success] = 'Successfully leaved event'
    redirect_back(fallback_location: @event)
  end
end
