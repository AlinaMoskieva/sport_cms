class AddColumnSubscribedCategoriesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscribed_categories, :text
  end
end
