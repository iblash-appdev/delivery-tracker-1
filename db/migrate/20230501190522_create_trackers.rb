class CreateTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :trackers do |t|
      t.string :status
      t.integer :user_id
      t.string :delivery_date
      t.string :detail
      t.string :description

      t.timestamps
    end
  end
end
