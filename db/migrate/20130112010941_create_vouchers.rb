class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :description, :null => false
      t.string :price, :decimal, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end