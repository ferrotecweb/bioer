class Categorylist < ActiveRecord::Base  
  belongs_to :category,:foreign_key => "categoryid"
  
  validates_presence_of     :categoryid ,  :message => "所属栏目不能为空"
  validates_presence_of   :title , :message => "标题不能为空"
  validates_uniqueness_of   :title , 
                                :on => :create,
                                :message => "标题不能重复"
  
  #validates_format_of :summarypic,
  #                        :on => :create,
  #                        :with => %r{\.(gif|jpg|png)$}i,
  #                        :message => "必须输入以gif|jpg|png后缀的路径"
                        
  validates_length_of :summary,:in => 2..10000,:message => "图文简介没在限定范围内"                     
  
  file_column :summarypic
  #file_column :downloadfile
 
  #has_attachment :content_type => :image,
  #                 :storage => :file_system,
  #                 :min_size => 0.kilobytes,
  #                 :max_size => 1.megabytes,
  #                 :resize_to => '640x480>',
  #                 :thumbnails => { :thumb => '100x100>' },
  #                 :path_prefix => 'public/upload/Image'

  #validates_as_attachment

  #自定义图片的存储路径
  #def full_filename(thumbnail = nil)      
  #        file_system_path = (thumbnail ? thumbnail_class : self).attachment_options[:path_prefix]      
  #        case self.thumbnail      
  #        when "Image"        
  #                File.join(RAILS_ROOT, file_system_path, 'Image', thumbnail_name_for(thumbnail))      
  #        else        
  #                File.join(RAILS_ROOT, file_system_path, 'Images', thumbnail_name_for(thumbnail))      
  #        end 
  #end
  

end
