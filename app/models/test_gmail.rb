class TestGmail < ActionMailer::Base


  def notifier(mail, sent_at = Time.now)
    subject    mail[:subject]
    recipients mail[:recipients]
    if mail[:from]
       from   mail[:from]    else
       from   'caiy@ferrotec.com.cn'
    end
    sent_on    sent_at
    body       :content => mail[:body]
#    attachment "image/png" do |a|
#      a.body = File.read("public/images/rails.png")
#      a.filename = "rails.png"
#    end

      if mail[:photoname] != nil
      content_type = case File.extname(mail[:photoname])
      when ".jpg" ; "image/jpg"
      when ".png" ; "image/x-png"
      when ".gif" ; "image/gif"
      when ".pdf" ; "application/pdf"
      else ; "application/octet-stream"
      end 
     @data=""
     File.open("#{RAILS_ROOT}/public/productphoto/#{mail[:photoname]}","rb").each {|read| @data<<read}
     #attachment :content_type => content_type, :filename => File.basename(attach.filename), :body=>@data
     attachment content_type do |a|
       a.body = @data
       a.filename = "invoice" + File.extname(mail[:photoname])
     end
      end
    charset "utf-8"
  end
end
