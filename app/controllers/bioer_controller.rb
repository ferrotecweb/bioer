class BioerController < ApplicationController
  before_filter:initialization
  layout nil
  def bioerfirstpage
    #读取新闻标题
    @news = Bioer.find_by_sql("select * from categorylists where substring(categoryid,1,3) = '004' ORDER BY createdate desc LIMIT 3")  
    #读取最新子菜单
    @topurl = Bioer.find_by_sql("select * from categories where istop = 1") 
    
    #根据奇偶月份替换flash
    getdate = Time.now  
    #datemonth = getdate.strftime("%m")  
    #ruby中的strftime %U从星期日开始算 %W从星期一开始算
    dateweek = getdate.strftime("%W")
    flag = dateweek.to_i % 2
    
    if flag == 0 
      @flashurl = "/images/ch1.swf"
    else
      @flashurl = "/images/ch.swf"
    end
    
  end
  def bioer_en
    #读取新闻标题
    @news = Bioer.find_by_sql("select * from en_categorylists where substring(categoryid,1,3) = '004' ORDER BY createdate desc LIMIT 3")  
    #读取最新子菜单
    @topurl = Bioer.find_by_sql("select * from en_categories where istop = 1") 
    
    #根据奇偶月份替换flash
    getdate = Time.now    
    #datemonth = getdate.strftime("%m")  
    #ruby中的strftime %U从星期日开始算 %W从星期一开始算
    dateweek = getdate.strftime("%W")
    flag = dateweek.to_i % 2
    #flag = datemonth.to_i % 2
    
    if flag == 0 
      @flashurl = "/images/en1.swf"
    else
      @flashurl = "/images/en.swf"
    end
  end
end
