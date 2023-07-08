class GuestActivitiesController < ApplicationController

  def create
    @guestactivity = GuestActivity.new
    @activity = Activity.find(params[:activity_id])
    @guestactivity.guest = Guest.find_by(user: current_user, event: @activity.event)
    @guestactivity.activity = @activity
    @guestactivity.save
    redirect_to event_activity_path(event_id: @activity.event, id: @activity.id), notice: 'Participation created!'
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @guest = Guest.find_by(user: current_user, event: @activity.event)
    @guest_activity = GuestActivity.find_by(activity_id: @activity.id, guest_id: @guest.id)
    @guest_activity.destroy

    redirect_to event_activity_path(event_id: @guest_activity.activity.event.id, id: @guest_activity.activity.id), notice: 'Participation canceled!'
  end
end
