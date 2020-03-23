class CreateAttributions < ActiveRecord::Migration[6.0]
  def change
    create_table :attributions do |t|
      t.references :player, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
