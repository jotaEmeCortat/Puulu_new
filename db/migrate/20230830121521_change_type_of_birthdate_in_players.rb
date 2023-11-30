class ChangeTypeOfBirthdateInPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :birthdate
    add_column :players, :birthdate, :integer
  end
end
