# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
 #require 'gettext/rails'
 #GetText.output_charset = 'UTF-8'
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  #init_gettext 'test_gettext'
  #before_filter:set_lang
  #def set_lang
  #  GetText.locale = "cn"
  #end
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery  :secret => '13506f686280cd5f5d7a60c53c10d9d5'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  before_filter :initialization 
  private
 
  def initialization
      #产品中心
      @menu1 = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '001' and length(categoryid) = 6 order by categoryorder")      
      #市场应用  
      @menu2 = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '002' and length(categoryid) = 6")
      #支持服务
      @menu3 = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '003' and length(categoryid) = 6")
      #新闻中心
      @menu4 = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '004' and length(categoryid) = 6")
      #营销网络
      @menu5 = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '005' and length(categoryid) = 6")
      #关于博日
      @menu6 = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '006' and length(categoryid) = 6 order by id desc") 
      #交流园地
      @menu7 = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '007' and length(categoryid) = 6") 
      #产品中心下级最小菜单代码 
      @minmenuid1 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '001' and length(categoryid) >= 6 group by url,categoryid")
      if  @minmenuid1.size > 0 then
        for minmenuid1 in @minmenuid1
        @minmenu1 = minmenuid1.categoryid
        end
      end      
      #市场应用下级最小菜单代码 
      @minmenuid2 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '002' and length(categoryid) >= 6 group by url,categoryid")
      if  @minmenuid2.size > 0 then
        for minmenuid2 in @minmenuid2
        @minmenu2 = minmenuid2.categoryid
        end
      end
      
      #支持服务下级最小菜单代码 
      #@minmenuid3 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '003' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid3.size > 0 then
      #  for minmenuid3 in @minmenuid3
      #  @minmenu3 = minmenuid3.categoryid
      #  end
      #end
      @minmenu3 = "003001"
    
      #新闻中心下级最小菜单代码 
      #@minmenuid4 = Bioer.find_by_sql("select max(categoryid) as categoryid,createdate from categorylists where substring(categoryid,1,3) = '004' and length(categoryid) >= 6 group by createdate")
      @minmenuid4 = Bioer.find_by_sql("select categoryname,categoryid from categories  where categoryid = (select distinct categoryid from categorylists  where createdate = (select max(createdate) as createdate from categorylists where substring(categoryid,1,3) = '004' and length(categoryid) >= 6)  )")
      if  @minmenuid4.size > 0 then
        for minmenuid4 in @minmenuid4
        @minmenu4 = minmenuid4.categoryid
        end
      end
      
      #营销网络下级最小菜单代码 
      #@minmenuid5 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '005' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid5.size > 0 then
      #  for minmenuid5 in @minmenuid5
      #  @minmenu5 = minmenuid5.categoryid
      #  end
      #end
      @minmenu5 = "005002"
      
      #关于博日下级最小菜单代码 
      #@minmenuid6 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '006' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid6.size > 0 then
      #  for minmenuid6 in @minmenuid6
      #  @minmenu6 = minmenuid6.categoryid
      #  end
      #end
      @minmenu6 = "006001"
      
      #交流园地下级最小菜单代码 
      #@minmenuid7 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '007' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid7.size > 0 then
      #  for minmenuid7 in @minmenuid7
      #  @minmenu7 = minmenuid7.categoryid
      #  end
      #end
      @minmenu7 = "007002"
      
    
      #英文版 e表示英文
      #产品中心
      @menue1 = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '001' and length(categoryid) = 6 order by categoryorder")      
      #市场应用  
      @menue2 = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '002' and length(categoryid) = 6")
      #支持服务
      @menue3 = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '003' and length(categoryid) = 6")
      #新闻中心
      @menue4 = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '004' and length(categoryid) = 6")
      #营销网络
      @menue5 = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '005' and length(categoryid) = 6")
      #关于博日
      @menue6 = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '006' and length(categoryid) = 6") 
      #交流园地
      @menue7 = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '007' and length(categoryid) = 6") 
      #产品中心下级最小菜单代码 
      @minmenueid1 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from en_categories where substring(categoryid,1,3) = '001' and length(categoryid) >= 6 group by url,categoryid")
      if  @minmenueid1.size > 0 then
        for minmenueid1 in @minmenueid1
        @minmenue1 = minmenueid1.categoryid
        end
      end      
      #市场应用下级最小菜单代码 
      @minmenueid2 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from en_categories where substring(categoryid,1,3) = '002' and length(categoryid) >= 6 group by url,categoryid")
      if  @minmenueid2.size > 0 then
        for minmenueid2 in @minmenueid2
        @minmenue2 = minmenueid2.categoryid
        end
      end
      
      #支持服务下级最小菜单代码 
      #@minmenuid3 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '003' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid3.size > 0 then
      #  for minmenuid3 in @minmenuid3
      #  @minmenu3 = minmenuid3.categoryid
      #  end
      #end
      @minmenue3 = "003001"
    
      #新闻中心下级最小菜单代码 
      #@minmenuid4 = Bioer.find_by_sql("select max(categoryid) as categoryid,createdate from categorylists where substring(categoryid,1,3) = '004' and length(categoryid) >= 6 group by createdate")
      @minmenueid4 = Bioer.find_by_sql("select categoryname,categoryid from en_categories  where categoryid = (select distinct categoryid from categorylists  where createdate = (select max(createdate) as createdate from categorylists where substring(categoryid,1,3) = '004' and length(categoryid) >= 6)  )")
      if  @minmenueid4.size > 0 then
        for minmenueid4 in @minmenueid4
        @minmenue4 = minmenueid4.categoryid
        end
      end
      
      #营销网络下级最小菜单代码 
      #@minmenuid5 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '005' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid5.size > 0 then
      #  for minmenuid5 in @minmenuid5
      #  @minmenu5 = minmenuid5.categoryid
      #  end
      #end
      @minmenue5 = "005002"
      
      #关于博日下级最小菜单代码 
      #@minmenuid6 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '006' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid6.size > 0 then
      #  for minmenuid6 in @minmenuid6
      #  @minmenu6 = minmenuid6.categoryid
      #  end
      #end
      @minmenue6 = "006001"
      
      #交流园地下级最小菜单代码 
      #@minmenuid7 = Bioer.find_by_sql("select min(categoryorder) as menuid,url,categoryid from categories where substring(categoryid,1,3) = '007' and length(categoryid) >= 6 group by url,categoryid")
      #if  @minmenuid7.size > 0 then
      #  for minmenuid7 in @minmenuid7
      #  @minmenu7 = minmenuid7.categoryid
      #  end
      #end
      @minmenue7 = "007002"
  end
  
  def productmenu
    #读取产品中心菜单下级信息
    @productcenter = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '001' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @productcentercount = @productcenter.size
    @detailcount = 0
  end
  
  def productmenue
    #读取产品中心菜单下级信息
    @productcenter = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '001' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @productcentercount = @productcenter.size
    @detailcount = 0
  end
  
  def solveprecentmenu
    #读取市场应用菜单下级信息
    @solveprecent = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '002' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @solveprecentcount = @solveprecent.size
    @detailcount = 0
  end
  def solveprecentmenue
    #读取市场应用菜单下级信息
    @solveprecent = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '002' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @solveprecentcount = @solveprecent.size
    @detailcount = 0
  end
  
  def serveareamenu
    #读取支持服务菜单下级信息
    @servearea = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '003' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @serveareacount = @servearea.size
    @detailcount = 0
  end
  def serveareamenue
    #读取支持服务菜单下级信息
    @servearea = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '003' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @serveareacount = @servearea.size
    @detailcount = 0
  end
  
  def newscentermenu
    #读取新闻中心菜单下级信息
    @newscenter = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '004' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @newscentercount = @newscenter.size
    @detailcount = 0
  end
  def newscentermenue
    #读取新闻中心菜单下级信息
    @newscenter = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '004' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @newscentercount = @newscenter.size
    @detailcount = 0
  end
  def businessnetworkmenu
    #读取营销菜单下级信息
    @businessnetwork = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '005' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @businessnetworkcount = @businessnetwork.size
    @detailcount = 0
  end
  def businessnetworkmenue
    #读取营销菜单下级信息
    @businessnetwork = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '005' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @businessnetworkcount = @businessnetwork.size
    @detailcount = 0
  end
  #def personjobmenu
  #  #读取人才招聘菜单下级信息
  #  @personjob = Bioer.find_by_sql("select * from menus where substring(menu_id,1,3) = '006' and length(menu_id) >= 6  order by menu_id")
  #  @count = 0
  #  @personjobcount = @personjob.size
  #  @detailcount = 0
  #end
  
  def aboutbioermenu
    #读取关于博日菜单下级信息
    @aboutbioer = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '006' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @aboutbioercount = @aboutbioer.size
    @detailcount = 0
  end
  def aboutbioermenue
    #读取关于博日菜单下级信息
    @aboutbioer = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '006' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @aboutbioercount = @aboutbioer.size
    @detailcount = 0
  end
  
  def communionmenu
    #读取交流园地菜单下级信息
    @communion = Bioer.find_by_sql("select * from categories where substring(categoryid,1,3) = '007' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @communioncount = @communion.size
    @detailcount = 0
  end
  
  def communionmenue
    #读取交流园地菜单下级信息
    @communion = Bioer.find_by_sql("select * from en_categories where substring(categoryid,1,3) = '007' and length(categoryid) = 6  order by categoryorder")
    @count = 0
    @communioncount = @communion.size
    @detailcount = 0
  end
  
  #用户
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "对不起，请先登陆"
      redirect_to(:controller => "login", :action => "login")
    end
  end
  
     before_filter :configure_charsets      
   
   def configure_charsets            
       headers["Content-Type"]="text/html;charset=utf-8"        
   end   
    def uploadfile(file)      
     if !file.original_filename.empty?    
       #生成一个随机的文件名        
       @filename=getfilename(file.original_filename)           
       #向dir目录写入文件    
       File.open("#{RAILS_ROOT}/public/download/#{@filename}", "wb") do |f|     
          f.write(file.read)    
       end     
       #返回文件名称，保存到数据库中    
       return @filename   
     end    
  end     
   
  def getfilename(filename)    
     if !filename.nil?  
       #下载uuidtools gem install uuidtools
       #require 'uuidtools'    
       #filename.sub(/.*./,UUID.random_create.to_s+'.')  
       
       #获取文件后缀名
       backname = File.extname(filename) 
       filename.sub(/.*./,Time.now.to_i.to_s+backname)  
     end    
  end   

end
