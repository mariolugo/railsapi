class AddTableNoticeType < ActiveRecord::Migration
  def change
    create_table :notice_types do |t|
      t.integer :type
      t.string :name_type

      t.timestamps null: false
    end
  end
end
