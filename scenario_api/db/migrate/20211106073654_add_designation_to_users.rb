class AddDesignationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :designation, :string, default: nil, limit: 255 unless column_exists?(:users, :designation).present?
  end
end
