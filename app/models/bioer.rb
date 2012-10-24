class Bioer < ActiveRecord::Base
  set_table_name "menus"
  set_table_name "bioers"
  set_table_name "categories"
  set_table_name "categorylists"
  set_table_name "contacts"
  
  file_column :summarypic
end
