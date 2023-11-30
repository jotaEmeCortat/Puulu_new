class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy]

  def index
    @teams = current_user.teams
  end

  def show
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to player_path(@player), notice: 'Player was successfully updated.'
  end

  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    # the user, who creates the player is the owner of that player:
    if @player.save
      redirect_to team_players_path(@player.team), notice: 'Player was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    redirect_to team_players_path(@player.team), status: :see_other, notice: 'Player was successfully deleted.'
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :nationality, :gender, :description,
                                   :position, :handedness, :available, :birthdate,
                                   :team_id)
  end
end
