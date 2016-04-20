class CreateCategories < ActiveRecord::Migration
  def change
    create_table :category do |t|
      t.string :category, null: false

      t.timestamps null: false
    end
  end
end
