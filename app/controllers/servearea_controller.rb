class ServeareaController < ApplicationController
  #支持服务
  before_filter:initialization
  before_filter:serveareamenu
  layout "bioer"
  def servearea
    #session[:machinecode] = nil
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
