class AddEnIstop < ActiveRecord::Migration
  def self.up
    add_column :en_categories,:istop,:boolean
  end

  def self.down
    remove_column :en_categories,:istop
  end
end
