class AddSubscribedCategoriesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscribed_categories, :text
    remove_column :users, :role, :integer
    add_column :users, :role, :string
  end
end
