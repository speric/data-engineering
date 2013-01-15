class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id, :null => true
      t.integer :voucher_id, :null => true
      t.integer :merchant_id, :null => true
      t.integer :voucher_count, :null => true
      t.timestamps
    end
  end
end