class NewscentereController < ApplicationController
  #新闻中心  英文版
  before_filter:initialization
  before_filter:newscentermenue
  layout "bioer_en"
  def newscentere
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from en_categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
