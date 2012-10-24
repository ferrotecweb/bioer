class EnCategory < ActiveRecord::Base
  set_primary_key "categoryid"
  has_many :categorylists,:foreign_key => "categoryid"
  
  validates_presence_of     :categoryname ,  :message => "栏目名称不能为空"
  validates_uniqueness_of   :categoryname , 
                                :on => :create,
                                :message => "栏目名称不能重复"
  validates_length_of :summary,:in => 2..10000,:message => "栏目内容没在限定范围内"
  #validates_format_of :summarypic,
  #                        :on => :create,
  #                        :with => %r{\.(gif|jpg|png)$}i,
  #                        :message => "必须输入以gif|jpg|png后缀的路径"  
  file_column :summarypic
  
  def self.before_save(len,istop)
    if len == 9 and istop == "1"
    EnCategory.update_all("istop = 0")
    end 
  end
end
