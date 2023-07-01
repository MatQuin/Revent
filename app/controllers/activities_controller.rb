class ActivitiesController < ApplicationController

  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    @event = Event.find(params[:event_id])
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @event = Event.find(params[:event_id])
    @activity.event = @event
    if @activity.save
      redirect_to dashboard_path
    else
  #    render :new, status: :unprocessable_entity
    render "event/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
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
    params.require(:activity).permit(:start, :end)
  end

  end
