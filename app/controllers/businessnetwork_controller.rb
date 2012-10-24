class BusinessnetworkController < ApplicationController
  #营销网络
  before_filter:initialization
  before_filter:businessnetworkmenu
  layout "bioer"
  def businessnetwork
    @menuid = params[:id]
    #@zgdq  = Bioer.find_by_sql("select area,company,phone from contacts where categoryid = '" + params[:id] + "'")
    @url =Bioer.find_by_sql("select url from categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
