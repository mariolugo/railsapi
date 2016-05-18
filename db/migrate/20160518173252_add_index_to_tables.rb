class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :users, :comite_id
  end
end
