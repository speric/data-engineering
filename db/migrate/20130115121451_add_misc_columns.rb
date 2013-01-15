class AddMiscColumns < ActiveRecord::Migration
  def up
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_ip, :string
    add_column :users, :current_login_ip, :string
    add_column :users, :single_access_token, :string

    add_index :customers, :full_name
    add_index :merchants, :full_name
    add_index :merchants, :address
    add_index :orders, :customer_id
    add_index :orders, :voucher_id
    add_index :orders, :merchant_id
    add_index :vouchers, :description
  end

  def down
  end
end
