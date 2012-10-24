class ProductcenterController < ApplicationController
  #产品中心
  before_filter:initialization
  before_filter:productmenu
  layout "bioer"
  def productcenter
    @menuid =  params[:id]
    @url =Bioer.find_by_sql("select url from categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end

