class RenameTableActions < ActiveRecord::Migration[7.0]
  def change
    rename_table :actions, :player_actions
  end
end
