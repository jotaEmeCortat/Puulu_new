class AddPositionToActions < ActiveRecord::Migration[7.0]
  def change
    add_column :actions, :position, :string
  end
end
