class Photo < ActiveRecord::Base
    validates_format_of :photoname,
    :with=>/^.*(.jpg|.JPG|.gif|.GIF)$/,
    :message => "你只能上传JPG或则GIF的图片文件"

#    acts_as_fleximage :image_directory => 'public/productphoto'
#    file_column :image, :magick => {
#           :versions => { "thumb" => "50x50", "medium" => "640x480>" }
#         }

   has_attachment  :storage => :file_system,
   :max_size => 1.megabytes,
   :size => 1..1.megabyte,
   :content_type =>  :image,
   :processor => :MiniMagick,
   :thumbnails => { :main => '100×100>', :thumb => '60×60>', :tiny => '40×40>' },
   :path_prefix=>'public/productphoto'
end
