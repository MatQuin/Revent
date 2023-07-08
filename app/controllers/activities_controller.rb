class ActivitiesController < ApplicationController

  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @event = Event.find(params[:event_id])
    @activities = @event.activities
    @guest_activity = GuestActivity.new
    @proposition = Proposition.new
  end

  def new
    @activity = Activity.new
    @event = Event.find(params[:event_id])
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.guest = Guest.where(user: current_user).first
    @event = Event.find(params[:event_id])
    @activity.event = @event
    if @activity.save
      redirect_to new_event_activity_path(@event), notice: 'Activity created! Feel free to create another one.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    @activity = Activity.find(params[:id])
    @propositions = @activity.propositions
    @proposition = Proposition.new
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, status: :see_other
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:start, :end, :description)
  end
end
