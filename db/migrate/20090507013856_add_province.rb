class AddProvince < ActiveRecord::Migration
  def self.up
    add_column :contacts,:province,:string 
  end

  def self.down
    remove_column :contacts,:province
  end
end
