<%
productid=request.form("productid")
company=request.form("company")
yourname=request.form("yourname")
email=request.form("email")
mymail=request.form("mymail")
tel=request.form("tel")
product_name=request.form("product_name")
code=request.form("code")
addr=request.form("addr")
content=request.form("content")
mailsubject="您的产品订单"
content = "<span style='font-family:Verdana,; font-size:9pt;'>您的产品订单内容如下:<br><br>产品ID:"&productid&"<br>产品名称:"&product_name&"<br><br>客户内容如下:<br>姓名:"&yourname&"<br>公司名称:"&company&"<br>电话:"&tel&"<br>邮件:"&email&"<br>邮编:"&code&"<br>地址:"&addr&"<br>留言:"&content&"<br><br>系统发送信息，请非回复!</span>"
Set msg = Server.CreateObject("JMail.Message")
msg.silent = true
msg.Logging = true
msg.Charset = "gb2312"
msg.MailServerUserName = "l-x-d@126.com" '此为您邮箱的登录帐号，使用时请更改为自己的邮箱登录帐号
msg.MailServerPassword = "lqihai" '此为您邮箱的登录密码，使用时请更改为自己的邮箱登录密码
msg.From = "l-x-d@126.com" '发件人Email
msg.FromName = "订单提醒" '发件人姓名
msg.AddRecipient mymail '收件人Email
msg.Subject = mailsubject '邮件主题
msg.Body = content '邮件正文
msg.contenttype ="text/html"
msg.Send ("smtp.126.com") 'SMTP服务器地址
msg.close()
set msg = nothing
response.write"<SCRIPT language=JavaScript>alert('Sent successfully!');"
response.write"this.location.href='feedback.asp';</SCRIPT>" 
%> 
