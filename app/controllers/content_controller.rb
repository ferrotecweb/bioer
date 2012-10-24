class ContentController < ApplicationController
  #具体内容
  layout nil
  
  #中国地区
  def chinaarea    
    @menu = params[:id]
    @zgdq  = Bioer.find_by_sql("select * from contacts where categoryid = '" + params[:id] + "' order by area")
  end
  
  #工作机会
  def workchance   
    @menu = params[:id]
    @gzjh  = Order.paginate :page => params[:page], :per_page => 10,:order => "createdate"
  end
  def workinfo
    @menu = params[:id]
    @order= Order.find_by_sql("select * from orders where id = '" + params[:id] + "'")
  end
  
  #联系我们
  def contactus
    @menu = params[:id]
    #读取联系我们内容
    @lxwmtop = Bioer.find_by_sql("select * from contacts where categoryid = '" + params[:id] + "' and istop=1")
    @lxwmdetail = Bioer.find_by_sql("select * from contacts where categoryid = '" + params[:id] + "' and istop<>1")
    @category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end  
  end
  
  #产品中心
  def productcontent
    @menu = params[:id]
    @cpzx = Category.find_by_sql("select id, categoryid,summary,summarypic,content,particularcontent from categories where categoryid = '" + params[:id] + "'")
    @cpzxdetail = Categorylist.find_by_sql("select id,categoryid,title,summary,summarypic,content from categorylists where categoryid = '" + params[:id] + "' order by createdate desc")    
  end
  
  def productlistdetail
     @menu = params[:id]
     @productdetail = Categorylist.find_by_sql("select * from categorylists where id = '" + params[:id] + "'")
  end
  
  #发展历程
  def developcourse
    @menu = params[:id]   
    @fzlc = Categorylist.find_by_sql("select id,categoryid,title,summary,summarypic from categorylists where categoryid = '" + params[:id] + "' order by createdate desc")    
    #@category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    #if  @category.size > 0 then
    #    for category in @category
    #    @title = category.categoryname
    #    end
    #end  
  end
  #资质证书
  def certificate
    @menu = params[:id]   
    @zzzh = Categorylist.find_by_sql("select id,categoryid,title,summary,summarypic from categorylists where categoryid = '" + params[:id] + "' order by titleorder")    
  end
  
  #地理位置
  def geographyposition
    @menu = params[:id]
    @dlwz = Bioer.find_by_sql("select * from contacts where categoryid = '" + params[:id] + "'")
  end
  
  #市场应用
  #根据传入的ID不同显示
  def applyfield
    @menu = params[:id]
    @scyy = Categorylist.paginate :page => params[:page], :per_page => 3,:conditions => {:categoryid => params[:id]}
    #@scyy = Categorylist.find_by_sql("select id,categoryid,title,summary,summarypic from categorylists where categoryid = '" + params[:id] + "'")
    #读取标题
    @category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end  
  end
  #详细了解内容
  def information
    @menu = params[:id]
    @info= Categorylist.find_by_sql("select * from categorylists where id = '" + params[:id] + "'")
  end
  
  
  #产品大类
  def producttype
    @menu = params[:id]
    #读取主产品信息
    @cpdl = Category.find(:all,:conditions => {:categoryid => params[:id]})
    #产品大类明细
    if params[:id].length == 3
    @cpdldetail = Category.find(:all,:conditions => " substring(categoryid,1,3) = '" + params[:id]  + "' and length(categoryid) = 6 and summarypic is not null and summarypic <> ''",:order => "categoryorder") 
    else
    @cpdldetail = Category.find(:all,:conditions => " substring(categoryid,1,6) = '" + params[:id]  + "' and length(categoryid) = 9 and summarypic is not null and summarypic <> ''",:order => "categoryorder")
    end
    #读取标题
    #@category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    if  @cpdl.size > 0 then
        for categoryname in @cpdl
          @title = categoryname.categoryname
        end
    end  
  end
  
  def communion
    @menu = params[:id]
    @contact  = Contact.new
  end
  
  #添加留言
  def add_communion
    @contact = Contact.new(params[:contact])
    if request.post? and params[:commit] == "提交"
      categoryid = params[:contact][:categoryid]
      @contact .categoryid = params[:contact][:categoryid]

      @contact .createdate = Time.now
      @contact .save


      mail_content = Hash.new;
      mail_content[:subject] = "客户留言"
      #mail_content[:recipients] = content[:recipients]
      mail_content[:recipients] = "mkt@bioer.com.cn"

      customer_info = "<p>留言信息:</p>"
      customer_info = customer_info + "<p>1、公司：" + params[:contact][:company] + "</p>"
      customer_info = customer_info + "<p>2、姓名：" + params[:contact][:person] + "</p>"
      customer_info = customer_info + "<p>3、地址：" + params[:contact][:addr] + "</p>"
      customer_info = customer_info + "<p>4、电话：" + params[:contact][:phone] + "</p>"
      customer_info = customer_info + "<p>5、Email：" + params[:contact][:email] + "</p>"
      customer_info = customer_info + "<p>6、留言：" + params[:contact][:content] + "</p>"


      mail_content[:body] = customer_info
      mail_content[:photoname]= nil
      email = TestGmail.create_notifier(mail_content)
      TestGmail.deliver(email)

      flash[:notice] = "提交成功！"
      
      @contact  = Contact.new
      redirect_to :controller => 'content',:action => 'communion',:id => categoryid
    else
      @contact  = Contact.new
      redirect_to :controller => 'content',:action => 'communion',:id => categoryid
    end
  end
  
  
  #支持服务
  #下载列表
  def servearea
    @menu = params[:id]
    #读取标题
    @category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end  
    if @title != "Q&A" and @title != "技术书籍下载" and @title != "相关文献下载" and @title != "技术资料下载" 
      #unless User.find_by_id(session[:machinecode])
      if session[:machinecode] != nil
        @jszc = Categorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
      else
        redirect_to(:controller => "content", :action => "login",:id=>@menu )
      end
    else
      @jszc = Categorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
    end
    #@jszc = Bioer.find_by_sql("select id,title from categorylists where categoryid = '" + params[:id] + "' order by createdate desc")   
  end

    #支持服务
  #下载列表
  def serveareae
    @menu = params[:id]
    #读取标题
    @category = EnCategory.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end
    if @title != "Q&A" and @title != "Technic Articles" and @title != "Literature" and @title != "Technic Material" and @title != "Catalog"
      if session[:machinecode] != nil
        @jszc = EnCategorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
      else
        redirect_to(:controller => "content", :action => "logine",:id=>@menu )
      end
    else
      @jszc = EnCategorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
    end
  end

  def software
#     @menu = params[:id]
    #读取标题
#    @category = Category.find(:all,:conditions => {:categoryid => params[:id]})
#    if  @category.size > 0 then
#        for category in @category
#        @title = category.categoryname
#        end
#    end

    #unless User.find_by_id(session[:machinecode])
    @menu = params[:id]
    if session[:machinecode] != nil
      @jszc = Categorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='003002'"  ,:order => "createdate desc"
    else
      redirect_to(:controller => "content", :action => "login",:id=>@menu )
    end

  end

  def software_en
    @menu = params[:id]
    if session[:machinecode] != nil
      @jszc = EnCategorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='003002'"  ,:order => "createdate desc"
    else
      redirect_to(:controller => "content", :action => "logine",:id=>@menu )
    end
  end
  
  #下载页面
  def downloadfile
    @menu = params[:id] 
    @downloadfile = Categorylist.find_by_sql("select id,downloadfile,title,summarypic from categorylists where id = '" + params[:id] + "' order by createdate desc")   
  end
  #问答页面
  def questionview
    @menu = params[:id] 
    
    #读取标题
    @category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end  
    
    @jszc =  Categorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
        
  end
  #机器码验证  
  def verify

    if request.post? and params[:commit] == "提交"
      flash[:notice] = ""
      machinecode = params[:machinecode][:machinecode]
      if machinecode !="" 
        if machinecode.length != 7 
          flash[:notice] = "只能输入7位机器码,请确认!"
          #redirect_to :controller => 'content',:action => 'login' 
        else
            if machinecode.slice(0,3) == "BYQ"
              backfour = machinecode.slice(machinecode.length - 4,4)
              0.upto(3) do |loop_index|
                if backfour[loop_index] >= 48 and  backfour[loop_index] <= 57
                else
                  flash[:notice] = "无效的机器码,请确认!"
                  
                  #redirect_to :controller => 'content',:action => 'login'           
                end
              end
              
              #redirect_to :controller => 'content',:action => 'servearea',:id=> params[:id]
            else
              flash[:notice] = "无效的机器码,请确认!"
              #redirect_to :controller => 'content',:action => 'login'
            end
         end
      else
          flash[:notice] = "无效的机器码,请确认!"
          #redirect_to :controller => 'content',:action => 'login'
      end
      #@machinecode = Machinecode.find(:all,:conditions => {:machinecode => machinecode})
      #if @machinecode.size > 0 then
      #  session[:machinecode] = machinecode
      #  redirect_to :controller => 'content',:action => 'servearea',:id=> params[:id]
      #else
      #  flash[:notice] = "无效的机器码,请确认!"
      #  redirect_to :controller => 'content',:action => 'login'
      #end
    else
      flash[:notice] = "请输入正确的机器码!"
    end
    
    if flash[:notice] != "" 
      redirect_to :controller => 'content',:action => 'login',:id=> params[:id]
    else
      session[:machinecode] = machinecode
      if params[:id].to_s.slice(0,6) == "003002"
        redirect_to :controller => 'content',:action => 'software',:id=> params[:id]
      else
        redirect_to :controller => 'content',:action => 'servearea',:id=> params[:id]
      end
      
    end
     
  end
  
  def login
     @menu = params[:id]
  end
  
  #新闻中心
  def newscenter
    @menu = params[:id]
    #获取年份和公告栏
    #@category = Category.find_by_sql("select max(createdate) as abc,summary from categories where substring(categoryid,1,3) = '004' and length(categoryid) = 6 group by summary")
    @category = Category.find_by_sql("select categoryname,summary from categories where categoryid = '" + params[:id] + "'")
    if  @category.size > 0 then
        for category in @category
        #@year = category.categoryname.slice(0,4)
        if category.summary.to_s != ""
        @summary = category.summary
        else
        @summary = "无公告信息！"
        end
        end
    end 
    @categorylist= Categorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
    #@categorylist = Categorylist.find_by_sql("select id,categoryid,title,substring(createdate,1,10) as cdate from categorylists where categoryid = '" + params[:id] + "' order by createdate")
  end
  #新闻详情
  def newsdetail
    @menu = params[:id]
    #一条新闻详细信息
    @categorylist = Categorylist.find_by_sql("select * from categorylists where id = '" + params[:id] + "'")
  end
  #查询
  def query
    
  end
  #证书预览
  def pictureview
    @menu = params[:id]
    @zs = Categorylist.find_by_sql("select * from categorylists where id = '" + params[:id] + "'")
  end
  
  #产品详细信息
  def productdetail
    @menu = params[:id]
    @productdetail = Category.find_by_sql("select * from categories where categoryid = '" + params[:id] + "'")
  end
  
  ##################英文版本#
  #产品大类
  def producttypee
    @menu = params[:id]
    #读取主产品信息
    @cpdl = EnCategory.find(:all,:conditions => {:categoryid => params[:id]})
    #产品大类明细
    if params[:id].length == 3
    @cpdldetail = EnCategory.find(:all,:conditions => " substring(categoryid,1,3) = '" + params[:id] + "' and length(categoryid) = 6 and summarypic is not null and summarypic <> ''",:order => "categoryorder")
    else
    @cpdldetail = EnCategory.find(:all,:conditions => " substring(categoryid,1,6) = '" + params[:id] + "' and length(categoryid) = 9 and summarypic is not null and summarypic <> ''",:order => "categoryorder")
    end
    #读取标题
    #@category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    if  @cpdl.size > 0 then
        for categoryname in @cpdl
          @title = categoryname.categoryname
        end
    end  
  end
  
  #中国地区
  def chinaareae    
    @menu = params[:id]
    @zgdq  = Bioer.find_by_sql("select * from en_contacts where categoryid = '" + params[:id] + "' order by area")
  end

  
  #联系我们
  def contactuse
    @menu = params[:id]
    #读取联系我们内容
    @lxwmtop = Bioer.find_by_sql("select * from en_contacts where categoryid = '" + params[:id] + "' and istop=1")
    @lxwmdetail = Bioer.find_by_sql("select * from en_contacts where categoryid = '" + params[:id] + "' and istop<>1")
    @category = EnCategory.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end  
  end
  
  #产品中心
  def productcontente
    @menu = params[:id]
    @cpzx = EnCategory.find_by_sql("select id, categoryid,summary,summarypic,content,particularcontent from en_categories where categoryid = '" + params[:id] + "'")
    @cpzxdetail = EnCategorylist.find_by_sql("select id,categoryid,title,summary,summarypic,content from en_categorylists where categoryid = '" + params[:id] + "' order by titleorder")    
  end
  
  #发展历程
  def developcoursee
    @menu = params[:id]   
    @fzlc = EnCategorylist.find_by_sql("select id,categoryid,title,summary,summarypic from en_categorylists where categoryid = '" + params[:id] + "' order by createdate desc")    
    #@category = Category.find(:all,:conditions => {:categoryid => params[:id]})
    #if  @category.size > 0 then
    #    for category in @category
    #    @title = category.categoryname
    #    end
    #end  
  end
  #资质证书
  def certificatee
    @menu = params[:id]   
    @zzzh = EnCategorylist.find_by_sql("select id,categoryid,title,summary,summarypic from en_categorylists where categoryid = '" + params[:id] + "' order by titleorder")    
  end
  
  #地理位置
  def geographypositione
    @menu = params[:id]
    @dlwz = Bioer.find_by_sql("select * from en_contacts where categoryid = '" + params[:id] + "'")
  end
  
  #市场应用
  #根据传入的ID不同显示
  def applyfielde
    @menu = params[:id]
    @scyy = EnCategorylist.paginate :page => params[:page], :per_page => 3,:conditions => {:categoryid => params[:id]}
    #@scyy = Categorylist.find_by_sql("select id,categoryid,title,summary,summarypic from categorylists where categoryid = '" + params[:id] + "'")
    #读取标题
    @category = EnCategory.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end  
  end
  #详细了解内容
  def informatione
    @menu = params[:id]
    @info= EnCategorylist.find_by_sql("select * from en_categorylists where id = '" + params[:id] + "'")
  end
  
  
  def communione
    @menu = params[:id]
    @contact  = EnContact.new
  end
  
  #添加留言
  def add_communione
    @contact = EnContact.new(params[:contact])
    if request.post? and params[:commit] == "submit"
      categoryid = params[:contact][:categoryid]
      @contact .categoryid = params[:contact][:categoryid]

      @contact .createdate = Time.now
      @contact .save

      flash[:notice] = "submit success！"
      
      @contact  = Contact.new
      redirect_to :controller => 'content',:action => 'communion',:id => categoryid
    else
      @contact  = Contact.new
      redirect_to :controller => 'content',:action => 'communion',:id => categoryid
    end
  end
  
  

  def logine
     @menu = params[:id]
  end
  #下载页面
  def downloadfilee
    @menu = params[:id] 
    @downloadfile = EnCategorylist.find_by_sql("select id,downloadfile,title,summarypic from en_categorylists where id = '" + params[:id] + "' order by createdate desc")   
  end
  #问答页面
  def questionviewe
    @menu = params[:id] 
    #读取标题
    @category = EnCategory.find(:all,:conditions => {:categoryid => params[:id]})
    if  @category.size > 0 then
        for category in @category
        @title = category.categoryname
        end
    end  
    
    @jszc =  EnCategorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
  
  end
  #机器码验证  
  def verifye
   
     if request.post? and params[:commit] == "submit"
      flash[:notice] = ""
      machinecode = params[:machinecode][:machinecode]
      if machinecode !="" 
        if machinecode.length != 7 
          flash[:notice] = "Only seven imported machine code, please confirm!"
        else
            if machinecode.slice(0,3) == "BYQ"
              backfour = machinecode.slice(machinecode.length - 4,4)
              0.upto(3) do |loop_index|
                if backfour[loop_index] >= 48 and  backfour[loop_index] <= 57
                else
                  flash[:notice] = "Ineffective machine yard, affirm that please!"        
                end
              end
            else
              flash[:notice] = "Ineffective machine yard, affirm that please!"
            end
         end
      else
          flash[:notice] = "Ineffective machine yard, affirm that please!"
      end

    else
      flash[:notice] != "Ineffective machine yard, affirm that please!" 
    end



    if flash[:notice] != "" 
      redirect_to :controller => 'content',:action => 'logine',:id=> params[:id]
    else
      session[:machinecode] = machinecode
      if params[:id].to_s.slice(0,6) == "003002"
        redirect_to :controller => 'content',:action => 'software_en',:id=> params[:id]
      else
        redirect_to :controller => 'content',:action => 'serveareae',:id=> params[:id]
      end
      
    end

  end

  
  #新闻中心
  def newscentere
    @menu = params[:id]
    #获取年份和公告栏
    #@category = EnCategory.find_by_sql("select max(createdate) as abc,summary from en_categories where substring(categoryid,1,3) = '004' and length(categoryid) = 6 group by summary")
    @category = Category.find_by_sql("select categoryname,summary from en_categories where categoryid = '" + params[:id] + "'")
    if  @category.size > 0 then
        for category in @category
        #@year = category.categoryname.slice(0,4)
        if category.summary.to_s != ""
        @summary = category.summary
        else
        @summary = "There be no announcement information！"
        end
        end
    end 
    @categorylist= EnCategorylist.paginate :page => params[:page],:per_page => 10,:conditions => " categoryid ='" +  params[:id] + "'"  ,:order => "createdate desc"
    #@categorylist = Categorylist.find_by_sql("select id,categoryid,title,substring(createdate,1,10) as cdate from categorylists where categoryid = '" + params[:id] + "' order by createdate")
  end
  #新闻详情
  def newsdetaile
    @menu = params[:id]
    #一条新闻详细信息
    @categorylist = EnCategorylist.find_by_sql("select * from en_categorylists where id = '" + params[:id] + "'")
  end
  #查询
  def querye
    
  end
  #证书预览
  def pictureviewe
    @menu = params[:id]
    @zs = EnCategorylist.find_by_sql("select * from en_categorylists where id = '" + params[:id] + "'")
  end
  
    #产品详细信息
  def productdetaile
    @menu = params[:id]
    @productdetail = EnCategory.find_by_sql("select * from en_categories where categoryid = '" + params[:id] + "'")
  end
  
  def productlistdetaile
     @menu = params[:id]
     @productdetail = EnCategorylist.find_by_sql("select * from en_categorylists where id = '" + params[:id] + "'")
  end
end
