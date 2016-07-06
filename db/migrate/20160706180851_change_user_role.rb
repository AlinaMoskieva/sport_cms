class ChangeUserRole < ActiveRecord::Migration
  def change
    change_column :users, :role, :string
    change_column_default :users, :role, "user"
  end
end
