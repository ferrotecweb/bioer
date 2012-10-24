class BackManager::OrderController < ApplicationController
  before_filter :authorize, :except => :login

  layout "admin"
  def add_order
    @order = Order.new(params[:order])
    if request.post? 
      @order.createdate = Time.now
      if @order.save
      flash.now[:notice] = "招聘信息添加成功！"
      @order = Order.new
      else
        render :action => 'add_order'
      end 
    end
  end

  def edit_order
    @order = Order.find(params[:id])
  end

  def list_order
    #@all_orders = Order.find(:all)
    @all_orders = Order.paginate :page => params[:page], :per_page => 23,:order => "createdate"
  end

  def delete_order
    if request.post?
      order = Order.find(params[:id])
      begin
        order.destroy
        flash[:notice] = "招聘信息删除成功！"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_order)
  end
  
  def update_order
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = '修改成功'
      redirect_to :action => 'list_order'
    else
      render :action => 'edit_order'
    end
  end

end
