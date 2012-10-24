class BackManager::EnCategorylistController < ApplicationController
  before_filter :authorize, :except => :login
  layout "admin"
  
  def add_categorylist

    #新增标识
    @flag = 1
    @categorylist = EnCategorylist.new(params[:categorylist])
    if request.post?
      @categorylist.categoryid = params[:categorylist][:categoryid]
      @categorylist.title = params[:categorylist][:title]
      if @categorylist.downloadfile != "" and @categorylist.downloadfile != nil
        @categorylist.downloadfile = uploadfile(params[:categorylist][:downloadfile]) 
      end 
      @categorylist.createdate = Time.now
      if @categorylist.save
      
      #flash.now[:notice] = "栏目 #{@categorylist.categoryname} 添加成功！"
      #@categorylist = CategoryList.new
      flash[:notice] = "标题 #{@categorylist.title} 添加成功！"
      redirect_to :action => 'list_categorylist'
      else
        render :action => 'add_categorylist'
      end 
    end
  end

    def add_software

    #新增标识
    @flag = 1
    @categorylist = EnCategorylist.new(params[:categorylist])

    @categorylist.categoryid = params[:id] unless params[:id].nil?


    if request.post?
      @categorylist.categoryid = "003002"
      @categorylist.title = params[:categorylist][:title]
      if @categorylist.downloadfile != "" and @categorylist.downloadfile != nil
        @categorylist.downloadfile = uploadfile(params[:categorylist][:downloadfile])
      end
      #@categorylist.createdate = Time.now
      if @categorylist.save

      #flash.now[:notice] = "栏目 #{@categorylist.categoryname} 添加成功！"
      #@categorylist = CategoryList.new
      flash[:notice] = "软件内容 #{@categorylist.title} 添加成功！"
      redirect_to :action => 'list_software'
      else
        render :action => 'add_software'
      end
    end
  end

  def edit_categorylist
    #修改标识
    @flag = 0
    @categorylist = EnCategorylist.find(params[:id])
  end

  def edit_software
    #修改标识
    @flag = 0
    @categorylist = EnCategorylist.find(params[:id])
  end

  def list_categorylist
    #@all_categorylists = Categorylist.find(:all,:conditions => {:categoryid => '001'},:order => "categoryid")
    #@all_categorylists = Categorylist.find(:all,:order => "categoryid")
    @all_categorylists = EnCategorylist.paginate :page => params[:page], :per_page => 23,:order => "createdate desc"
  end

    def list_software
    @all_categorylists = EnCategorylist.paginate :page => params[:page], :per_page => 22,:conditions => {:categoryid => '003002'},:order => "createdate desc"
  end
  
  def query_categorylist

    if params[:categorylist][:categoryid].to_s != nil and params[:categorylist][:categoryid].to_s != ""
      @all_categorylists = EnCategorylist.paginate :page => params[:page], :per_page => 22,:conditions => {:categoryid => params[:categorylist][:categoryid].to_s},:order => "createdate desc"        
    else
      @all_categorylists = EnCategorylist.paginate :page => params[:page], :per_page => 22,:order => "createdate desc"
    end
  end
  
  def delete_categorylist
    if request.post?
      categorylist = EnCategorylist.find(params[:id])
      begin
        categorylist.destroy
        flash[:notice] = "标题 #{categorylist.title} 删除成功"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_categorylist)
  end

  def delete_software
    if request.post?
      categorylist = EnCategorylist.find(params[:id])
      begin
        categorylist.destroy
        flash[:notice] = "标题 #{categorylist.title} 删除成功"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => :list_software)
  end

  def update_categorylist
    @categorylist = EnCategorylist.find(params[:id])
    if @categorylist.update_attributes(params[:categorylist])
      flash[:notice] = '修改成功'
      redirect_to :action => 'list_categorylist'
    else
      render :action => 'edit_categorylist'
    end
  end

  def update_software
    @categorylist = EnCategorylist.find(params[:id])
    if params[:categorylist][:downloadfile] != "" and params[:categorylist][:downloadfile] != nil
      @categorylist.downloadfile = uploadfile(params[:categorylist][:downloadfile])
      params[:categorylist][:downloadfile] = @categorylist.downloadfile
    end
    if @categorylist.update_attributes(params[:categorylist])
      flash[:notice] = '修改成功'
      redirect_to :action => 'list_software'
    else
      render :action => 'edit_software'
    end
  end

end
