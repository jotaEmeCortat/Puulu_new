class DashboardsController < ApplicationController
  before_action :authenticate_user!
  # Allow the user to see the homepage without having to log in
  # skip_before_action :authenticate_user!, only: [:home]

  def show
    @user = User.find(current_user.id)

    @teams = current_user.teams
    @team = Team.find_by(user_id: current_user)
    # @teams = Team.where(user_id: current_user).order(:name)

    @games = Game.where(team_id: @teams.pluck(:id)).group_by(&:date)

    @players = @team.players
    
  end

  def result
    @game = Game.find(params[:id])
    @players = @game.players
  end
end
