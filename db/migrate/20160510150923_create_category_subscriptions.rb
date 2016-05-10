class CreateCategorySubscriptions < ActiveRecord::Migration
  def change
    create_table :category_subscriptions do |t|
      t.integer :user_id
      t.text :categories

      t.timestamps null: false
    end
  end
end
