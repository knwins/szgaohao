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
mailsubject="���Ĳ�Ʒ����"
content = "<span style='font-family:Verdana,; font-size:9pt;'>���Ĳ�Ʒ������������:<br><br>��ƷID:"&productid&"<br>��Ʒ����:"&product_name&"<br><br>�ͻ���������:<br>����:"&yourname&"<br>��˾����:"&company&"<br>�绰:"&tel&"<br>�ʼ�:"&email&"<br>�ʱ�:"&code&"<br>��ַ:"&addr&"<br>����:"&content&"<br><br>ϵͳ������Ϣ����ǻظ�!</span>"
Set msg = Server.CreateObject("JMail.Message")
msg.silent = true
msg.Logging = true
msg.Charset = "gb2312"
msg.MailServerUserName = "l-x-d@126.com" '��Ϊ������ĵ�¼�ʺţ�ʹ��ʱ�����Ϊ�Լ��������¼�ʺ�
msg.MailServerPassword = "lqihai" '��Ϊ������ĵ�¼���룬ʹ��ʱ�����Ϊ�Լ��������¼����
msg.From = "l-x-d@126.com" '������Email
msg.FromName = "��������" '����������
msg.AddRecipient mymail '�ռ���Email
msg.Subject = mailsubject '�ʼ�����
msg.Body = content '�ʼ�����
msg.contenttype ="text/html"
msg.Send ("smtp.126.com") 'SMTP��������ַ
msg.close()
set msg = nothing
response.write"<SCRIPT language=JavaScript>alert('Sent successfully!');"
response.write"this.location.href='feedback.asp';</SCRIPT>" 
%> 
