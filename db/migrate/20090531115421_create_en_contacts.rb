class CreateEnContacts < ActiveRecord::Migration
  def self.up
    create_table :en_contacts do |t|
      t.column :categoryid,  :string,:null => false
      t.column :country,:string
      t.column :area,:string
      t.column :company,:string
      t.column :person,:string 
      t.column :addr,:string  
      t.column :phone,:string
      t.column :email,:string 
      t.column :fax,:string   
      t.column :zipcode,:string         
      t.column :content,    :text
      t.column :createdate,:datetime
    end
  end

  def self.down
    drop_table :en_contacts
  end
end
