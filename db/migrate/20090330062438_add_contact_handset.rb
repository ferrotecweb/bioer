class AddContactHandset < ActiveRecord::Migration
  def self.up
    add_column :contacts,:handset,:string
  end

  def self.down
    remove_column :contacts,:handset
  end
end
