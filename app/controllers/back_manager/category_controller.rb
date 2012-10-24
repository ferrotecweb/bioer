class BackManager::CategoryController < ApplicationController
  before_filter :authorize, :except => :login
  layout "admin"
  
  def index
    
  end
  
  def list_category
    @all_categorys = Category.find(:all,:order => "categoryid")
    #@product_pages, @products = paginate :contacts, :per_page => 10
  end
  
  def add_category
    #添加标识
    @flag = 1
    #category = Category.find(params[:id])
    #获取当前栏目下级的最大categoryid
    #@maxcategoryid = Bioer.find_by_sql("select max(categoryid) as categoryid from categories where substring(categoryid,1,3) = '001' and length(categoryid) = 6")
    @maxcategoryid = Bioer.find_by_sql("select max(categoryid) as categoryid from categories 
where substring(categoryid,1,length('" + params[:categoryid].to_s + "')) = '" + params[:categoryid].to_s +
        "' and length(categoryid) = length('" + params[:categoryid].to_s + "') + 3")
    
    if @maxcategoryid.size > 0  then      
      for maxcategoryid in @maxcategoryid
        #如何没有下层
        if maxcategoryid.categoryid  != nil then
          categoryid = maxcategoryid.categoryid.slice(maxcategoryid.categoryid.length-2,2).to_i + 1
          if categoryid.to_s.length == 1  then
            categoryid = "0" + categoryid.to_s
          end
          @getmaxcategoryid = maxcategoryid.categoryid.slice(0,maxcategoryid.categoryid.length-2) + categoryid
        else
          @getmaxcategoryid = params[:categoryid] + "001"
        end
      end
    
    end 

    @category = Category.new(params[:category])
    #if request.post?  and @category.save
    if request.post? 
      @category.categoryid = params[:category][:categoryid]
      @category.istop = params[:category][:istop]
      @category.createdate = Time.now

      Category.before_save(params[:category][:categoryid].length,params[:category][:istop])

      if @category.save
      #flash.now[:notice] = "栏目 #{@category.categoryname} 添加成功！"
      #@category = Category.new
      flash[:notice] = "栏目 #{@category.categoryname} 添加成功！"
      redirect_to :action => 'list_category'
      else
        @flag = 1
        @getmaxcategoryid = @category.categoryid
        #:categoryid => @category.categoryid.slice(0,@category.categoryid.length-3)
        render :action => 'add_category'
      end 
    end
  end
  
  def edit_category
    #修改标识
    @flag = 0
    @category = Category.find(params[:id])
  end
  
  def update_category
    @category = Category.find(params[:id])

    Category.before_save(params[:category][:categoryid].length ,params[:category][:istop])

    if @category.update_attributes(params[:category])
      flash[:notice] = '修改成功'
      redirect_to :action => 'list_category'
    else
      render :action => 'edit_category'
    end
  end
  
  def delete_category
    if request.post?
      @categorylist = Category.find_by_sql("select t.categoryid from categories w,categorylists t
        where w.categoryid = t.categoryid and w.categoryid='" + params[:id] + "'")
      
      if @categorylist.size > 0 then
        flash[:notice] = '已存在该产品明细信息，不允许删除！'
        redirect_to(:action => :list_category)
        return
      end
      categoryid = params[:id]
     
      @categoryquery = Category.find_by_sql("select categoryid from categories where 
substring(categoryid,1,length('" + categoryid +  "')) = '" + categoryid + "' and length(categoryid) = length('" + categoryid +  "') + 3" )
      
      if @categoryquery.size > 0 then
        flash[:notice] = '已存在该产品对的子产品，不允许删除！'
        redirect_to(:action => :list_category)
        return
      end
      
      category = Category.find(params[:id])
      begin
        category.destroy
        flash[:notice] = "栏目 #{category.categoryname} 删除成功"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_category)
  end

end
