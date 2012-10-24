class CreateEnCategories < ActiveRecord::Migration
  def self.up
    create_table :en_categories do |t|
      t.column :categoryid,  :string,:null => false
      t.column :categoryname,:string
      t.column :categoryorder,:integer     
      t.column :content,    :text
      t.column :particularcontent,    :text
      t.column :contentpic,:string
      t.column :url,:string
      t.column :summary,:string
      t.column :summarypic,:string
      t.column :createdate,:datetime
    end
  end

  def self.down
    drop_table :en_categories
  end
end
