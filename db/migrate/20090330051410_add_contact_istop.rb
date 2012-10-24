class AddContactIstop < ActiveRecord::Migration
  def self.up
    add_column :contacts,:istop,:boolean, default(0)
  end

  def self.down
    remove_column :contacts,:istop
  end
end
