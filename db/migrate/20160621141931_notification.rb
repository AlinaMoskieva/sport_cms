class Notification < ActiveRecord::Migration
  def change
    create_table :notification do |t|
      t.integer :comment_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end

