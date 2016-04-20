class RemoveThemeFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :theme, :string
  end
end
