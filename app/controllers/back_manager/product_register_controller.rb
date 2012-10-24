class BackManager::ProductRegisterController < ApplicationController
  before_filter :authorize, :except => :login
  layout "admin"
  def detail_register
    @register = ProductRegister.find(params[:id])
  end

  def list_register
    @register =  ProductRegister.paginate :page => params[:page], :per_page => 23
  end

  def delete_register
    if request.post?
      register = ProductRegister.find(params[:id])
      begin
        register.destroy
        flash[:notice] = "删除成功"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_register)
  end
end
