class Hashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :hashtag, null: false
      t.text :pages

      t.timestamps null: false
    end
  end
end
