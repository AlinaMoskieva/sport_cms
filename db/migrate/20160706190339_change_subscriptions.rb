class ChangeSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end

    remove_column :users, :category_subscriptions, :text
  end
end
