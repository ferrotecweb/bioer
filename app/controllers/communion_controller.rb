class CommunionController < ApplicationController
    #交流园地
    before_filter:initialization
    before_filter:communionmenu
    layout "bioer"
    def communion
    @menuid =  params[:id]
    @url =Bioer.find_by_sql("select url from categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
