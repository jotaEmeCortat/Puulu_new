class Team < ApplicationRecord
  include Abyme::Model

  belongs_to :user, optional: true

  has_many :games, dependent: :destroy
  has_many :players, inverse_of: :team, dependent: :destroy
  has_many :team_games, class_name: 'Game', foreign_key: 'team_id'
  has_many :opponent_team_games, class_name: 'Game', foreign_key: 'opponent_team_id', dependent: :destroy

  validates :name, presence: true, uniqueness: true

  abymize :players
end
