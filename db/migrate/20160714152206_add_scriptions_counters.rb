class AddScriptionsCounters < ActiveRecord::Migration
  def change
    add_column :users, :subscriptions_count, :integer, default: 0
  end
end
