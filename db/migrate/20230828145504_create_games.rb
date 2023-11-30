class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.date :date
      t.string :tournament
      t.string :location
      t.string :round
      t.integer :result
      t.integer :opponent_result
      t.references :team, foreign_key: true
      t.references :opponent_team, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
