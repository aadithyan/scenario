class CreateApiV1Organizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, limit: 100
      t.text :tag_line
      t.text :description
      t.string :email
      t.string :website, limit: 255
      t.text :address
      t.text :city, limit: 100
      t.string :state, limit: 100
      t.string :zip_postal_code, limit: 15
      t.text :country
      t.string :telephone
      t.string :logo
      t.integer :no_of_employees, default: 0
      t.integer :no_of_active_employees, default: 0
      t.integer :no_of_movies, default: 0
      t.date :started_from
      t.timestamps
    end
  end
end
