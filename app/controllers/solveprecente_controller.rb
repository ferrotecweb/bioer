class SolveprecenteController < ApplicationController
  #市场应用  英文版
  before_filter:initialization
  before_filter:solveprecentmenue
  layout "bioer_en"
  def solveprecente
    @menuid = params[:id]
    @url =Bioer.find_by_sql("select url from en_categories where categoryid = '"+params[:id]+"'")
    if  @url.size > 0 then
      for url in @url
        @menu  = url.url
      end
    end
  end
end
