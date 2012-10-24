class AboutbioereController < ApplicationController
    #关于博日  英文版
  before_filter:initialization
  before_filter:aboutbioermenue
  layout "bioer_en"
  def aboutbioere
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from en_categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
