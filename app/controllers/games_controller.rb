class GamesController < ApplicationController
  before_action :set_game, only: %i[show] # edit update destroy

  def new
    @game = Game.new
  end

  def create
    # Game.create!(date: Date.parse('2023-08-31'), location: "France", team: team)
    @game = Game.new(game_params)
    # redirect_to game_path
    if @game.save!
      redirect_to game_path(@game), notice: 'New Game - launched'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @player_action = PlayerAction.new
    @game = Game.find(params[:id])

    @team = @game.team
    @players = @team.players

    @opponent_team = @game.opponent_team
    @opponents = @opponent_team.players

    @player_actions = @game.player_actions

    @team_result = @game.result
    @opponent_result = @game.opponent_result
  end

  def pdf
    @game = Game.find(params[:id])
    @team = Team.find_by(user_id: current_user)

    @opponent_team = @game.opponent_team

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "shared/actions", encoding: 'UTF-8'
      end
    end
  end

  def result
    @game = Game.find(params[:id])
    @players = @game.players

    @teams = current_user.teams
    @team = Team.find_by(user_id: current_user)

    @opponent_team = @game.opponent_team
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:date, :team_id, :tournament, :location, :round, :opponent_player)
  end
end
