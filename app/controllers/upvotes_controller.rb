class UpvotesController < ApplicationController


  def create
    @proposition = Proposition.find(params[:proposition_id])
    @guest = Guest.find_by(user: current_user, event: @proposition.activity.event)
    @upvote = Upvote.new(proposition: @proposition, guest: @guest)
    if @upvote.save
      redirect_to event_activity_path(@proposition.activity.event.id, @proposition.activity), notice: 'You have voted !'
    else
      redirect_to event_activity_path(@proposition.activity.event.id, @proposition.activity), alert: 'You can vote only once!'
    end
  end


end
