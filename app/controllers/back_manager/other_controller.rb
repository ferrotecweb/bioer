class BackManager::OtherController < ApplicationController
  before_filter :authorize, :except => :login

  layout "admin"
  def add_other
    #新增标识
    @flag = 1
    
    @other = Contact.new(params[:other])
    if request.post? and @other.save
      flash.now[:notice] = "内容添加成功！"
      #@other = Contact.new
      redirect_to :action => 'list_other'
    end
  end

  def edit_other
    #修改标识
    @flag = 0
    
    @other = Contact.find(params[:id])
  end

  def list_other
    #@all_others = Contact.find(:all,:conditions => "categoryid <> '007'",:order => 'categoryid')
    @all_others = Contact.paginate :page => params[:page], :per_page => 22,:conditions => "categoryid <> '007'",:order => 'categoryid'
  end

  def delete_other
    if request.post?
      other = Contact.find(params[:id])
      begin
        other.destroy
        flash[:notice] = "内容删除成功！"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_other)
  end
  
  def update_other
    @other = Contact.find(params[:id])
    if @other.update_attributes(params[:other])
      flash[:notice] = '修改成功'
      redirect_to :action => 'list_other'
    else
      render :action => 'edit_other'
    end
  end
end
