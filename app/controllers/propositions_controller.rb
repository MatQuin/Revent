class PropositionsController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @propositions = @activity.propositions
    @guest_proposition = GuestProposition.new
  end

  def new
    @proposition = Proposition.new
    @activity = Activity.find(params[:event_id])
  end

  def create
    @proposition = Proposition.new(activity_params)
    @proposition.guest = Guest.where(user: current_user).first
    @activity = Activity.find(params[:event_id])
    @proposition.activity = @activity
    if @proposition.save
      redirect_to new_activity_proposition_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @proposition.update(proposition_params)
      redirect_to proposition_path(@proposition)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @proposition.destroy
    redirect_to propositions_path, status: :see_other
  end

  private

  def set_proposition
    @proposition = Proposition.find(params[:id])
  end

  def proposition_params
    params.require(:proposition).permit(:description)
  end
end
end
