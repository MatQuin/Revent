class PropositionsController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @propositions = @activity.propositions
    @guest_proposition = GuestProposition.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @proposition = Proposition.new(description: proposition_params[:description], activity_id: @activity.id)
    @proposition.guest = Guest.find_by(user: current_user, event: @activity.event)
    if @proposition.save
      redirect_to event_activity_path(@activity.event, @activity), notice: 'Proposition created!'
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
