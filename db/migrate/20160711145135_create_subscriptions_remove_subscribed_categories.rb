class CreateSubscriptionsRemoveSubscribedCategories < ActiveRecord::Migration
  def change
    remove_column :users, :subscribed_categories, :text
    create_table :subscriptions do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
