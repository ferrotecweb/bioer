class CreateEnOrders < ActiveRecord::Migration
  def self.up
    create_table :en_orders do |t|
      t.column :depart,   :string
      t.column :poth,  :string
      t.column :num,   :integer
      t.column :info,  :text
      t.column :workadd,:string
      t.column :overdate,:datetime 
      t.column :createdate,:datetime
    end
  end

  def self.down
    drop_table :en_orders
  end
end
