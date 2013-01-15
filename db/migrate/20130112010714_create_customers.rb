class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :full_name, :null => false 
      t.timestamps
    end
  end
end