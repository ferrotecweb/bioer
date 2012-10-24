class CreateMachinecodes < ActiveRecord::Migration
  def self.up
    create_table :machinecodes do |t|
      t.column :machinecode,:string
      t.timestamps
    end
  end

  def self.down
    drop_table :machinecodes
  end
end
