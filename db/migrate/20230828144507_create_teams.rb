class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :category
      t.string :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
