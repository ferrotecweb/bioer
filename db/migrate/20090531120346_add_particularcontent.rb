class AddParticularcontent < ActiveRecord::Migration
  def self.up
    add_column :categories,:particularcontent,:text
  end

  def self.down
    remove_column :categories,:particularcontent
  end
end
