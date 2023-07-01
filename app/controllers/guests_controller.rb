class GuestsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new()
    @guest.event = @event
    @guest.user = User.find(params[:guest][:user_id].to_i)
    if @guest.save
      redirect_to new_event_guest_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
