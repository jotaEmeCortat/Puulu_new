class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user

    if @team.save
      redirect_to teams_path, notice: 'Team is successfully created'  # ? redirect_to
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team), notice: 'Team was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy
    redirect_to dashboard_path, status: :see_other, notice: 'Team was successfully deleted.'
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :category, :country, players_attributes: [
                                 :name, :nationality, :gender, :description, :birthdate,
                                 :position, :handedness, :photo, :available, :_destroy
    ]
    )
  end
end
