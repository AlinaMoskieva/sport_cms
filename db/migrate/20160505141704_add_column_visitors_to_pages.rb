class AddColumnVisitorsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :visitors, :integer
  end
end
