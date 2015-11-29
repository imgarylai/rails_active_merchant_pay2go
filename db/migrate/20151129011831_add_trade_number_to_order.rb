class AddTradeNumberToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :trade_number, :string, unique: true
    add_index :orders, :trade_number, unique: true
  end
end
