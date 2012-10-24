class CreateEnCategorylists < ActiveRecord::Migration
  def self.up
    create_table :en_categorylists do |t|
      t.column :categoryid,  :string,:null => false
      t.column :title,:string
      t.column :titleorder,:integer 
      t.column :titlestyle,:string
      t.column :titleurl,:string      
      t.column :content,    :text
      t.column :particularcontent,    :text
      t.column :contentpic,:string
      t.column :writer,:string
      t.column :keyword,:string
      t.column :attribute,:string
      t.column :summary,:string
      t.column :summarypic,:string
      t.column :createdate,:datetime
    end
  end

  def self.down
    drop_table :en_categorylists
  end
end
