class Front::EditorsController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  # 上传图片   
  def upload_editor_image   
    file = params[:imgfile]   
    filename = params[:imgfile].original_filename.split('.').reverse     
    filename = Time.now.strftime("%Y%m%d%H%M%S")  + rand(10000).to_s + "." + filename[0]     
    File.open("#{File.expand_path(RAILS_ROOT)}/public/upload/editor_image/#{filename}", "wb") do |f|      
      f.write(file.read)           
    end         
    render :text => "<script>window.parent.LoadIMG('/upload/editor_image/#{filename}')</script>"  
  rescue  
    render :text => "<script>window.parent.alert('您上传的图片无效或者损坏！');window.parent.divProcessing.style.display='none'; </script>"  
  end  
     
  # 上传附件   
  def upload_editor_attach   
    file = params[:attach]   
    filename = params[:attach].original_filename.split('.').reverse     
    filename = Time.now.strftime("%Y%m%d%H%M%S") + rand(10000).to_s + "." + filename[0]     
    File.open("#{File.expand_path(RAILS_ROOT)}/public/upload/editor_attach/#{filename}", "wb") do |f|      
      f.write(file.read)           
    end         
    render :text => "<script>window.parent.LoadAttach('/upload/editor_attach/#{filename}')</script>"  
  rescue  
    render :text => "<script>window.parent.alert('您上传的附件无效或者损坏！');window.parent.divProcessing.style.display='none'; </script>"  
  end  
     
  def download_attach   
    send_file params[:path]   
  rescue  
    render :text => "对不起，改附件已经损坏，无法下载！"  
  end  

end
