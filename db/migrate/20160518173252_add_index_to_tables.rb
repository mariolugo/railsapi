class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :comites, :city_id
    add_index :users, :comite_id
  end
end
