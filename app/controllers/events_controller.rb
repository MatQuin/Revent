class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @events = Event.where("title ILIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @events = Event.all



    end
  end

  def new
    @event = Event.new
    @user  = current_user
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.guests.build(user: current_user)
    if @event.save
      redirect_to new_event_guest_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    if @event.geocoded?
      @markers = [{lat: @event.latitude, lng: @event.longitude, marker_html: render_to_string(partial: "marker")
        }]
    else
      @markers = [{}]
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :price, :start, :end, :status, :photo, :description)
  end
end
