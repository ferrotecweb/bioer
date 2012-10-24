class CreateBioers < ActiveRecord::Migration
  def self.up
    create_table :bioers do |t|
      t.column :menu_id,       :string,:null => false
      t.column :title,         :string
      t.column :content,       :text
      t.timestamps
    end
  end

  def self.down
    drop_table :bioers
  end
end
