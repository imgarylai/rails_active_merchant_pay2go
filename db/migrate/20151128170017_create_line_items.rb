class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true
      t.uuid :order_id, index: true, foreign_key: true
      t.decimal :unit_price, default: 0
      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
