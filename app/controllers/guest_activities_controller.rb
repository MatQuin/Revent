class GuestActivitiesController < ApplicationController

 def create
  @guestactivity = GuestActivity.new
  @activity = Activity.find(params[:activity_id])
  @guestactivity.guest = Guest.where(user: current_user, event: @activity.event).first
  @guestactivity.activity = @activity
  @guestactivity.save
  redirect_to event_activities_path(@activity.event)
 end
end
