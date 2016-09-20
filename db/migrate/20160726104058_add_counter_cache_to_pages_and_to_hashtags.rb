class AddCounterCacheToPagesAndToHashtags < ActiveRecord::Migration
  def change
    add_column :pages, :hashtag_count, :integer, default: 0
    add_column :hashtags, :pages_count, :integer, default: 0
  end
end
