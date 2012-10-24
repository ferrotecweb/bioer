class AddEnDownloadfile < ActiveRecord::Migration
  def self.up
    add_column :en_categorylists,:downloadfile,:string 
  end

  def self.down
    remove_column :en_categorylists,:downloadfile
  end
end
