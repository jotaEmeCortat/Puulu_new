class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :nationality
      t.string :gender
      t.text :description
      t.date :birthdate
      t.string :position
      t.string :handedness
      t.boolean :available
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
