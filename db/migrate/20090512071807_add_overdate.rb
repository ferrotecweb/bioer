class AddOverdate < ActiveRecord::Migration
  def self.up
    add_column :orders,:overdate,:datetime 
  end

  def self.down
    remove_column :orders,:overdate
  end
end
