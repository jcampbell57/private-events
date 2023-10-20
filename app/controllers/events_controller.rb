class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to new_event_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end
end
