class ChangeDefaultValueForGameResults < ActiveRecord::Migration[7.0]
  def change
    change_column_default :games, :result, 0
  end
end
