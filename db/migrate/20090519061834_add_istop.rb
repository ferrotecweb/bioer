class AddIstop < ActiveRecord::Migration
  def self.up
    add_column :categories,:istop,:boolean
  end

  def self.down
    remove_column :categories,:istop
  end
end
