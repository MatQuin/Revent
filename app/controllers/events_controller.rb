class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    @event = Event.new
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  # lock an event

private

  def event_params
    params.require(:event.permit(:address, :price, :start_date, :end_date, :color, :status))
  end
end

#il manque une description pour le event
