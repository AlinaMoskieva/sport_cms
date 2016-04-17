class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :theme, null: false
      t.integer :user_id, null: false, index: true   #тут

      t.timestamps null: false
    end
  end
end
