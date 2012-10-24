class AddWorkadd < ActiveRecord::Migration
  def self.up
    add_column :orders,:workadd,:string 
  end

  def self.down
    remove_column :orders,:workadd
  end
end
