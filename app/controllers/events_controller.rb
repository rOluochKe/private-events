# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in_user, only: %i[new create destroy]
  before_action :correct_user, only: %i[destroy]

  def new
    @event = current_user.hosting_events.build
  end

  def create
    @event = current_user.hosting_events.build(event_params)
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def index
    @events = Event.paginate(page: params[:page], per_page: per_page)
    @upcoming_events = @events.upcoming_events
    @past_events = @events.past_events
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = 'Event has been deleted'
    redirect_back(fallback_location: current_user)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end

  def correct_user
    @event = current_user.hosting_events.find_by(id: params[:id])
    redirect_to root_url if @event.nil?
  end
end
