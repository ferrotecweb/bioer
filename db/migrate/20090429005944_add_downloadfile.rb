class AddDownloadfile < ActiveRecord::Migration
  def self.up
    add_column :categorylists,:downloadfile,:string 
  end

  def self.down
    remove_column :categorylists,:downloadfile
  end
end
