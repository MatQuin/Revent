class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @events = Event.where(user: current_user)
    @activities = Activity.where(user: current_user)
  end
end
