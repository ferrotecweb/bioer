class NewscenterController < ApplicationController
  #新闻中心
  before_filter:initialization
  before_filter:newscentermenu
  layout "bioer"
  def newscenter
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
