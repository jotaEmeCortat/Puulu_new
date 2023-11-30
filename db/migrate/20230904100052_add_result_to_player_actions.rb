class AddResultToPlayerActions < ActiveRecord::Migration[7.0]
  def change
    add_column :player_actions, :result, :string
    add_column :player_actions, :time, :time
  end
end
