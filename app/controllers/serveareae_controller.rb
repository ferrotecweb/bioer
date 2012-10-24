class ServeareaeController < ApplicationController
  #支持服务
  before_filter:initialization
  before_filter:serveareamenue
  layout "bioer_en"
  def serveareae
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from en_categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
