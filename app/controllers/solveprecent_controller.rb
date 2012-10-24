class SolveprecentController < ApplicationController
  #市场应用
  before_filter:initialization
  before_filter:solveprecentmenu
  layout "bioer"
  def solveprecent
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
