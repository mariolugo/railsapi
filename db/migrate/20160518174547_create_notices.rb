class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :description
      t.string :address
      t.date :start_time
      t.date :end_time
      t.string :comite_id
      t.string :user_id
      t.string :notice_type_id

      t.timestamps null: false
    end
    add_index :notices, :comite_id
    add_index :notices, :user_id
    add_index :notices, :notice_type_id
  end
end
