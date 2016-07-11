class AddCounterCategoryToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :pages_count, :integer, :default => 0

    Category.reset_column_information
    Category.all.each do |p|
      p.update_attribute :pages_count, p.pages.count
    end
  end
end
