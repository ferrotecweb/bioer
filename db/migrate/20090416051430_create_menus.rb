class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.column :menuname,   :string
      t.column :menuurl,  :string
      t.column :menudeep1,   :integer
      t.column :menudeep2,  :integer
    end
  end

  def self.down
    drop_table :menus
  end
end
