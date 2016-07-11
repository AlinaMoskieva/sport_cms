class CreateSubscriptionsRemoveSubscribedCategories < ActiveRecord::Migration
  def change
    remove_column :users, :subscribed_categories, :text
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
