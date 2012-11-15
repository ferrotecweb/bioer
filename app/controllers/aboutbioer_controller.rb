class AboutbioerController < ApplicationController
  #关于博日的网页
  before_filter:initialization
  before_filter:aboutbioermenu
  layout "bioer"
  def aboutbioer
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
