class AddMixandmatchRefToAttributions < ActiveRecord::Migration[6.0]
  def change
    add_reference :attributions, :mixandmatch, foreign_key: true
  end
end
