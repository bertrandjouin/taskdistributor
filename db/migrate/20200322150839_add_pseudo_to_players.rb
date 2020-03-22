class AddPseudoToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :pseudo, :string
  end
end
