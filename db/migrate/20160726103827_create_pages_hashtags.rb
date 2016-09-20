class CreatePagesHashtags < ActiveRecord::Migration
  def change
    create_table :pages_hashtags do |t|
      t.belongs_to :page, index: true, foreign_key: true, null: false
      t.belongs_to :hashtag, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
