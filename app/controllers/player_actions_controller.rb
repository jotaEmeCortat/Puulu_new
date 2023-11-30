class PlayerActionsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @player_action = PlayerAction.new(player_action_params)
    @team = @game.team
    @players = @team.players

    @opponent_team = @game.opponent_team
    @opponents = @opponent_team.players

    @player_action.game = @game

    if @player_action.kind.empty? && params[:player_action][:kind_extra].present?
      @player_action.kind = params[:player_action][:kind_extra]
    end

    if @player_action.player_id.nil? && params[:player_action][:opponent_id].present?
      @player_action.player = Player.find(params[:player_action][:opponent_id])
    end
    @player_action.save!

    redirect_to game_path(@game)
  end

  private

  def player_action_params
    params.require(:player_action).permit(:kind, :kind_extra, :position, :result, :game_id, :player_id, :opponent_id)
  end
end
