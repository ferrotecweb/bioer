class BackManager::ContactController < ApplicationController
  #layout :determine_layout
  #目前还不知道怎么写，两个模板切换
  #def determine_layout
  #if ....
  #   "admin"
  #else
  #   "application"
  #end
  #Time.now
  before_filter :authorize, :except => :login
  layout "admin"
  def detail_contact
    @contact = Contact.find(params[:id])
  end

  def list_contact
    #007对应的是留言信息
    #@all_contacts = Contact.find(:all,:conditions => {:categoryid => '007'})
    @contacts= Contact.paginate :page => params[:page], :per_page => 23,:conditions => {:categoryid => '007002'}
  end
  
  def delete_contact
    if request.post?
      contact = Contact.find(params[:id])
      begin
        contact.destroy
        flash[:notice] = "删除成功"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_contact)
  end
  
end
