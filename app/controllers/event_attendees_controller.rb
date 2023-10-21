class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    flash[:notice] = 'You have registered for the event.'
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.event_attendees.find { |event_attendee| event_attendee.user_id == current_user.id }.destroy
    flash[:notice] = 'You have been unregistered for the event.'
    redirect_to @event
  end
end
