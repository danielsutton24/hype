class EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes(event_params)
    render json: event
  end

  private

  def event_params
    params.require(:event).permit(:done)
  end

end
