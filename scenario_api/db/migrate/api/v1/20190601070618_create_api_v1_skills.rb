class CreateApiV1Skills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false, limit: 255
      t.integer :years, default: 0, null: false
      t.integer :level_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
