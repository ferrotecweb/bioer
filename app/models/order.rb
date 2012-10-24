class Order < ActiveRecord::Base
  validates_presence_of     :depart ,  :message => "职位名称不能为空"
  validates_presence_of     :poth ,  :message => "职位类型不能为空"
  validates_presence_of     :workadd , :message => "工作地点"
  validates_presence_of     :overdate ,  :message => "截止时间称不能为空"
  validates_presence_of     :num ,  :message => "招聘人数不能为空"
  validates_presence_of     :info ,  :message => "招聘要求不能为空"                      
  #validates_length_of :summary,:in => 2..255   
end
