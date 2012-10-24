class SendController < ApplicationController   #class TestSendGmailController < ApplicationController
  layout nil
  
#  def create
#     @mailcontent = MailInfo.new()
#  end
#
#  def dosend
#    content = params[:mailcontent]
#    mail_content = Hash.new;
#    mail_content[:subject] = "一份客户满意度问卷"
#    #mail_content[:recipients] = content[:recipients]
#    mail_content[:recipients] = "bioer@bioer.com.cn"
#
#    #处理问卷信息
#    customer_info = "<p>个人资料</p>"
#    customer_info = customer_info + "<p>1、姓名：" + content[:a01] + "</p>"
#    customer_info = customer_info + "<p>2、单位：" + content[:a02] + "</p>"
#    customer_info = customer_info + "<p>3、实验室：" + content[:a03] + "</p>"
#    customer_info = customer_info + "<p>4、研究方向：" + content[:a04] + "</p>"
#    customer_info = customer_info + "<p>5、电话：" + content[:a05] + "</p>"
#    customer_info = customer_info + "<p>6、Email：" + params[:a06] + "</p>"
#    customer_info = customer_info + "<p>7、邮寄地址：" + content[:a07] + "</p>"
#    customer_info = customer_info + "<p>8、邮编：" + content[:a08] + "</p>"
#    customer_info = customer_info + "<p>问卷答案(注明：单选题：数字为当前选中的，多选题：1为打勾0为未打勾)</p>"
#    customer_info = customer_info + "<p>第一题：" + content[:a1] + "    " + content[:a1a] + "</p>"
#    customer_info = customer_info + "<p>第二题：" + content[:a2] +  "</p>"
#    customer_info = customer_info + "<p>第三题：" + content[:a3] +  "</p>"
#    customer_info = customer_info + "<p>第四题：" + content[:a4] +  "</p>"
#    customer_info = customer_info + "<p>第五题：" + content[:a5] +  "</p>"
#    customer_info = customer_info + "<p>第六题：" + content[:a6] +  "</p>"
#    customer_info = customer_info + "<p>第七题：" + content[:a7] +  "</p>"
#    customer_info = customer_info + "<p>第八题：" + content[:a8] +  "</p>"
#    customer_info = customer_info + "<p>第九题第一问：" + content[:a9] +  "</p>"
#    customer_info = customer_info + "<p>第九题第二问：" + content[:a91] +  "</p>"
#    customer_info = customer_info + "<p>第十题：" + content[:a10] +  "</p>"
#    customer_info = customer_info + "<p>第十一题："
#    i = params[:a11].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a11][params[:a11].size-i] + "  "
#      if params[:a11][params[:a11].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#
#    customer_info = customer_info  + content[:a11a] +  "</p>"
#    customer_info = customer_info + "<p>第十二题："
#    i = params[:a12].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a12][params[:a12].size-i] + "  "
#      if params[:a12][params[:a12].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#    customer_info = customer_info  + content[:a12a] +  "</p>"
#    customer_info = customer_info + "<p>第十三题："
#    i = params[:a13].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a13][params[:a13].size-i] + "  "
#      if params[:a13][params[:a13].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#    customer_info = customer_info  + content[:a13a] +  "</p>"
#    customer_info = customer_info + "<p>第十四题："
#    i = params[:a14].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a14][params[:a14].size-i] + "  "
#      if params[:a14][params[:a14].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#    customer_info = customer_info  + content[:a14a] + "</p>"
#    customer_info = customer_info + "<p>第十五题："
#    i = params[:a15].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a15][params[:a15].size-i] + "  "
#      if params[:a15][params[:a15].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#    customer_info = customer_info  + "</p>"
#    customer_info = customer_info + "<p>第十六题："
#    i = params[:a16].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a16][params[:a16].size-i] + "  "
#      if params[:a16][params[:a16].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#    customer_info = customer_info  + content[:a16a] + "</p>"
#
#
#    customer_info = customer_info + "<p>第十七题：" + content[:a17] +  "</p>"
#    customer_info = customer_info + "<p>第十八题：" + content[:a18] +  "</p>"
#    customer_info = customer_info + "<p>第十九题："
#    i = params[:a19].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a19][params[:a19].size-i] + "  "
#      if params[:a19][params[:a19].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#    customer_info = customer_info  + "</p>"
#    customer_info = customer_info + "<p>第二十题："
#    i = params[:a20].size
#
#    while i > 0 do
#      customer_info = customer_info + params[:a20][params[:a20].size-i] + "  "
#      if params[:a20][params[:a20].size-i].to_i == 1
#        i = i - 2
#      else
#        i = i - 1
#      end
#    end
#    customer_info = customer_info  + "</p>"
#
#    mail_content[:body] = customer_info
#    email = TestGmail.create_notifier(mail_content)
#    TestGmail.deliver(email)
#    flash[:note] ="非常感谢您能在百忙之中抽出时间来完成本次问卷，在核实问卷有效性后，我们将为您寄上精美礼品一份！！并敬请关注接下来的抽大奖活动！！再次感谢长期以来您对BIOER的关注和支持！！所有奖品都将于农历春节后两周内寄出"
#  end
#
#end

def sbpactivity
  @mailcontent = MainInfo.new()
end

def dosend
    content = params[:mailcontent]
    mail_content = Hash.new;
    mail_content[:subject] = "一份SBP移液器中文征名活动"
    #mail_content[:recipients] = content[:recipients]
    mail_content[:recipients] = "mkt@bioer.com.cn"

    customer_info = "<p>个人资料</p>"
    customer_info = customer_info + "<p>1、姓名：" + content[:name] + "</p>"
    customer_info = customer_info + "<p>2、单位：" + content[:unit] + "</p>"
    customer_info = customer_info + "<p>3、电话：" + content[:phone] + "</p>"
    customer_info = customer_info + "<p>4、地址：" + content[:address] + "</p>"
    customer_info = customer_info + "<p>5、邮编：" + content[:zipcode] + "</p>"
    if content[:isselect].to_s == "1"
    customer_info = customer_info + "<p>6、是否购买过博日产品：是</p>"
    customer_info = customer_info + "<p>购买产品型号：" + content[:producttype] + "</p>"
    else
    customer_info = customer_info + "<p>6、是否购买过博日产品：否</p>"
    end
    customer_info = customer_info + "<p>7、对SBP取的中文名字：" + content[:setname] + "</p>"

    mail_content[:body] = customer_info
    mail_content[:photoname]= nil
    email = TestGmail.create_notifier(mail_content)
    TestGmail.deliver(email)
    flash[:note] ="非常感谢您能在百忙之中抽出时间来参与本次活动。"
end




def product_register
  @productregister = ProductRegister.new()
  @photo = Photo.new()
  session[:this_photo] = nil
  @productregister.productregisterno = Time.now.strftime("%Y%m%d").to_s + rand(100-999).to_s
end

def saveregisterinfo
    @register = ProductRegister.new(params[:productregister])
    @register.created_at = Time.now
    @register.updated_at = Time.now
    @register.email = params[:email]
    @register.upperfile = session[:this_photo].to_s
    if request.post?  and @register.save

    mail_content = Hash.new;
    mail_content[:subject] = "一份客户的产品注册信息"
    #mail_content[:recipients] = content[:recipients]
    mail_content[:recipients] = "mkt@bioer.com.cn"
    #mail_content[:recipients] = "caiy@ferrotec.com.cn"
    customer_info = "<h3>用户基本信息</h3>"
    customer_info = customer_info + "<p>仪器注册号：" + @register.productregisterno + "</p>"
    customer_info = customer_info + "<p>1、单位：" + @register.company + "</p>"
    customer_info = customer_info + "<p>2、部门/科室/实验室：" + @register.dept + "</p>"
    customer_info = customer_info + "<p>3、电话：" + @register.phone + "</p>"
    customer_info = customer_info + "<p>4、传真：" + @register.fax + "</p>"
    customer_info = customer_info + "<p>5、地址：" + @register.address + "</p>"
    customer_info = customer_info + "<p>6、联系人：" + @register.linkman + "</p>"
    customer_info = customer_info + "<p>7、学历：" + @register.schoolrecord + "</p>"
    customer_info = customer_info + "<p>8、职位：" + @register.office + "</p>"
    customer_info = customer_info + "<p>9、电子邮件：" + @register.email + "</p>"
    customer_info = customer_info + "<p>10、研究方向：" + @register.research + "</p><br />"


    customer_info = customer_info + "<h3>产品信息</h3>"
    customer_info = customer_info + "<p>1、产品名称：" + @register.productname + "</p>"
    customer_info = customer_info + "<p>2、产品型号：" + @register.producttype + "</p>"
    customer_info = customer_info + "<p>3、产品编号：" + @register.productno + "</p>"
    customer_info = customer_info + "<p>4、生产日期：" + @register.productdate.strftime("%Y-%m-%d").to_s + "</p>"
    customer_info = customer_info + "<p>5、购买日期：" + @register.buydate.strftime("%Y-%m-%d").to_s + "</p>"
    customer_info = customer_info + "<p>6、供应商：" + @register.supplier + "</p>"
    customer_info = customer_info + "<p>7、购买凭证：见附件</p> <br />"

    customer_info = customer_info + "<h3>客户问答信息</h3>"
    customer_info = customer_info + "<p>1、产品使用频度：" + params[:productregister][:productusedtime] + "</p>"
    customer_info = customer_info + "<p>2、产品使用感受：" + params[:productregister][:productusedfeel] + "</p>"
    customer_info = customer_info + "<p>3.1、同类品牌：" + params[:productregister][:otherproductname] + "</p>"
    customer_info = customer_info + "<p>3.2、同类型号：" + params[:productregister][:otherproducttype] + "</p>"
    customer_info = customer_info + "<p>4、对其他感兴趣的产品：" 

    i = params[:otherproductfeel].size

    while i > 0 do
      customer_info = customer_info + params[:otherproductfeel][params[:otherproductfeel].size-i] + "  "
      if params[:otherproductfeel][params[:otherproductfeel].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end

    customer_info = customer_info +  "</p>"
    customer_info = customer_info + "<p>5、对博日产品的建议：" + params[:productregister][:memo] + "</p>"


    mail_content[:body] = customer_info
    mail_content[:photoname]= @register.upperfile
    email = TestGmail.create_notifier(mail_content)
    TestGmail.deliver(email)
    flash[:note] ="
非常感谢您填写了产品注册信息，您将获得为期一个月的额外保修时间，5个工作日内，我们将以传真或邮寄形式给您送去延长保修凭证。
再次感谢您对博日的支持和信赖"

    end
end

def photo_import
  @photo = Photo.new()
  @photo.photoname = uploadphotofile(params[:photo][:photoname])
  #@photo.photoname = uploadphotofile(params[:photo][:photoname])
  #判定上传内容类型
#  backname = File.extname(@photo.photoname)
#  if backname.upcase != ".JPG" or backname.upcase != ".GIF" or backname.upcase != ".PDF"
#
#  end
  @photo.created_at = Time.now
  @photo.updated_at = Time.now
  if @photo.save
    session[:this_photo] = @photo.photoname

    responds_to_parent do
        render :update do |page|
        page.replace_html 'showimage', '<div id ="showimage"><img src="/productphoto/' + @photo.photoname + '" alt="" border="0" id ="photo" width="200" height="200" /></div>'
        #page.insert_html :bottom, "showimage", :partial => '/send/photo_import', :object => @photo
        page.replace_html "show", "<div>上传成功</div>"
        page.visual_effect :highlight,'show'
      end
    end
  end
#  render :update do |page|
#    page.replace :dd,'<div>上传成功</div>'
#    render :partial=>'product_register'
#  end
end

#def savephoto
#  @photo = ProductRegister.new(params[:productregister])
#  @photo.save
#end


#class MailInfo
#  attr_accessor :subject, :recipients, :from, :sent_at, :body
#  #用户信息
#  attr_accessor :a01,:a02,:a03,:a04,:a05,:a06,:a07,:a08,:a09
#  attr_accessor :a1,:a1a,:a2,:a3,:a4,:a5,:a6,:a7,:a8,:a9,:a91,:a10
#  attr_accessor :a11,:a111,:a112,:a113,:a114,:a11a
#  attr_accessor :a12,:a121,:a122,:a123,:a124,:a125,:a126,:a127,:a12a
#  attr_accessor :a13,:a131,:a132,:a133,:a134,:a13a
#  attr_accessor :a14,:a141,:a142,:a143,:a144,:a145,:a14a
#  attr_accessor :a15,:a151,:a152,:a153,:a154,:a155,:a156,:a157,:a158,:a159,:a1510,:a1511,:a1512,:a1513
#  attr_accessor :a16,:a161,:a162,:a163,:a16a
#  attr_accessor :a19,:a191,:a192,:a193,:a194,:a195,:a196,:a197,:a198,:a199,:a1910,:a1911,:a1912
#  attr_accessor :a17,:a18,:a20,:a201,:a202,:a203
#end

end

class MainInfo
  attr_accessor :subject, :recipients, :from, :sent_at, :body,:attachment,:photoname
  attr_accessor :name,:unit,:phone,:address,:zipcode,:isselect,:producttype,:setname
end