class Contact < ActiveRecord::Base
  belongs_to :category,:foreign_key => "categoryid"
  
  validates_presence_of     :categoryid ,  :message => "所属栏目不能为空"
end
