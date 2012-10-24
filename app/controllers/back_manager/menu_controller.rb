class BackManager::MenuController < ApplicationController
  before_filter :authorize, :except => :login

  layout "admin"
  
  def list_menu
    @all_menus = Menu.find(:all)
  end

  def add_menu
    @menu = Menu.new(params[:user])
    if request.post? and @menu.save
      flash.now[:notice] = "子菜单 #{@menu.name} 添加成功！"
      @user = User.new
    end
  end

  def edit_menu
    @menu = Menu.find(params[:id])
  end
  
  def update_menu
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      flash[:notice] = '修改成功'
      redirect_to :action => 'list_menu'
    else
      render :action => 'edit_menu'
    end
  end
  
  def delete_menu
    if request.post?
      menu = Menu.find(params[:id])
      begin
        menu.destroy
        flash[:notice] = "子菜单 #{menu.menuname} 删除成功"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_menu)
  end

end
