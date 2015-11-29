class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders, id: :uuid do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :address
      t.hstore :params

      t.timestamps null: false
    end
  end
end
