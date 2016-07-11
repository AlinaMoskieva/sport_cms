class AddCounterCache < ActiveRecord::Migration
  def change
    add_column :categories, :pages_count, :integer, default: 0
    add_column :pages, :comments_count, :integer, default: 0
    add_column :users, :pages_count, :integer, default: 0
  end
end
