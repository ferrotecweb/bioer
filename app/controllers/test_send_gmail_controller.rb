class TestSendGmailController < ApplicationController
  layout nil
  
  def create
     @mailcontent = MailInfo.new()
  end

  def dosend
    content = params[:mailcontent]
    mail_content = Hash.new;
    mail_content[:subject] = "一份客户满意度问卷"
    #mail_content[:recipients] = content[:recipients]
    mail_content[:recipients] = "bioer@bioer.com.cn"

    #处理问卷信息
    customer_info = "<p>个人资料</p>"
    customer_info = customer_info + "<p>1、姓名：" + content[:a01] + "</p>"
    customer_info = customer_info + "<p>2、单位：" + content[:a02] + "</p>"
    customer_info = customer_info + "<p>3、实验室：" + content[:a03] + "</p>"
    customer_info = customer_info + "<p>4、研究方向：" + content[:a04] + "</p>"
    customer_info = customer_info + "<p>5、电话：" + content[:a05] + "</p>"
    customer_info = customer_info + "<p>6、Email：" + params[:a06] + "</p>"
    customer_info = customer_info + "<p>7、邮寄地址：" + content[:a07] + "</p>"
    customer_info = customer_info + "<p>8、邮编：" + content[:a08] + "</p>"
    customer_info = customer_info + "<p>9、意见：" + content[:a09] + "</p>"
    customer_info = customer_info + "<p>问卷答案(注明：单选题：数字为当前选中的，多选题：1为打勾0为未打勾)</p>"
    customer_info = customer_info + "<p>第一题：" + content[:a1] + "    " + content[:a1a] + "</p>"
    customer_info = customer_info + "<p>第二题：" + content[:a2] +  "</p>"
    customer_info = customer_info + "<p>第三题：" + content[:a3] +  "</p>"
    customer_info = customer_info + "<p>第四题：" + content[:a4] +  "</p>"
    customer_info = customer_info + "<p>第五题：" + content[:a5] +  "</p>"
    customer_info = customer_info + "<p>第六题：" + content[:a6] +  "</p>"
    customer_info = customer_info + "<p>第七题：" + content[:a7] +  "</p>"
    customer_info = customer_info + "<p>第八题：" + content[:a8] +  "</p>"
    customer_info = customer_info + "<p>第九题第一问：" + content[:a9] +  "</p>"
    customer_info = customer_info + "<p>第九题第二问：" + content[:a91] +  "</p>"
    customer_info = customer_info + "<p>第十题：" + content[:a10] +  "</p>"
    customer_info = customer_info + "<p>第十一题："
    i = params[:a11].size
     
    while i > 0 do
      customer_info = customer_info + params[:a11][params[:a11].size-i] + "  "
      if params[:a11][params[:a11].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end
    
    customer_info = customer_info  + content[:a11a] +  "</p>"
    customer_info = customer_info + "<p>第十二题：" 
    i = params[:a12].size
     
    while i > 0 do
      customer_info = customer_info + params[:a12][params[:a12].size-i] + "  "
      if params[:a12][params[:a12].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end
    customer_info = customer_info  + content[:a12a] +  "</p>"
    customer_info = customer_info + "<p>第十三题："
    i = params[:a13].size
     
    while i > 0 do
      customer_info = customer_info + params[:a13][params[:a13].size-i] + "  "
      if params[:a13][params[:a13].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end
    customer_info = customer_info  + content[:a13a] +  "</p>"
    customer_info = customer_info + "<p>第十四题："
    i = params[:a14].size
     
    while i > 0 do
      customer_info = customer_info + params[:a14][params[:a14].size-i] + "  "
      if params[:a14][params[:a14].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end 
    customer_info = customer_info  + content[:a14a] + "</p>"    
    customer_info = customer_info + "<p>第十五题："
    i = params[:a15].size
     
    while i > 0 do
      customer_info = customer_info + params[:a15][params[:a15].size-i] + "  "
      if params[:a15][params[:a15].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end 
    customer_info = customer_info  + "</p>" 
    customer_info = customer_info + "<p>第十六题："
    i = params[:a16].size
     
    while i > 0 do
      customer_info = customer_info + params[:a16][params[:a16].size-i] + "  "
      if params[:a16][params[:a16].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end 
    customer_info = customer_info  + content[:a16a] + "</p>" 

    
    customer_info = customer_info + "<p>第十七题：" + content[:a17] +  "</p>"
    customer_info = customer_info + "<p>第十八题：" + content[:a18] +  "</p>"
    customer_info = customer_info + "<p>第十九题："
    i = params[:a19].size
     
    while i > 0 do
      customer_info = customer_info + params[:a19][params[:a19].size-i] + "  "
      if params[:a19][params[:a19].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end 
    customer_info = customer_info  + "</p>" 
    customer_info = customer_info + "<p>第二十题："
    i = params[:a20].size
     
    while i > 0 do
      customer_info = customer_info + params[:a20][params[:a20].size-i] + "  "
      if params[:a20][params[:a20].size-i].to_i == 1
        i = i - 2
      else
        i = i - 1
      end
    end 
    customer_info = customer_info  + "</p>"  

    mail_content[:body] = customer_info
    email = TestGmail.create_notifier(mail_content)
    TestGmail.deliver(email)
    flash[:note] ="传送成功，谢谢您的参与!!!!"
  end

end

class MailInfo
  attr_accessor :subject, :recipients, :from, :sent_at, :body
  #用户信息
  attr_accessor :a01,:a02,:a03,:a04,:a05,:a06,:a07,:a08,:a09
  attr_accessor :a1,:a1a,:a2,:a3,:a4,:a5,:a6,:a7,:a8,:a9,:a91,:a10
  attr_accessor :a11,:a111,:a112,:a113,:a114,:a11a
  attr_accessor :a12,:a121,:a122,:a123,:a124,:a125,:a126,:a127,:a12a
  attr_accessor :a13,:a131,:a132,:a133,:a134,:a13a
  attr_accessor :a14,:a141,:a142,:a143,:a144,:a145,:a14a
  attr_accessor :a15,:a151,:a152,:a153,:a154,:a155,:a156,:a157,:a158,:a159,:a1510,:a1511,:a1512,:a1513
  attr_accessor :a16,:a161,:a162,:a163,:a16a
  attr_accessor :a19,:a191,:a192,:a193,:a194,:a195,:a196,:a197,:a198,:a199,:a1910,:a1911,:a1912
  attr_accessor :a17,:a18,:a20,:a201,:a202,:a203
end

