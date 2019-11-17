class EventsController < ApplicationController
  def index
    render json: Event.order(:id)
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes(event_params)
    render json: event
  end

  def create
    event = Event.create(event_params)
    render json: event
  end

  private

  def event_params
    params.require(:event).permit(:done, :title)
  end

end
