class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :full_name, :null => false
      t.string :address, :null => false
      t.timestamps
    end
  end
end