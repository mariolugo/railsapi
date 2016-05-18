class CreateComites < ActiveRecord::Migration
  def change
    create_table :comites do |t|
      t.string :name
      t.text :img, :limit => 4294967295 
      t.text :description
      t.string :suburb
      t.string :city

      t.timestamps null: false
    end
  end
end
