<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
xm=trim(request("xm"))
zh=trim(request("zh"))
pass=request("pass")
quanxian=replace(request("quanxian")," ","")
quanxian=","&quanxian&","
set rs=server.createobject("adodb.recordset")
rs.open "select zh from admin where zh='"&zh&"'",conn,3
if rs.eof then
   conn.execute "insert into quanxian (xm,zh,pass,quanxian) values ('"&xm&"','"&zh&"','"&pass&"','"&quanxian&"')"
   response.write "<script>alert('"&session("xm")&"�����Ѿ���ӳɹ���');window.location.href='quanxian.asp';</script>"
else
   response.write "<script>alert('"&session("xm")&"�����ݿ������и��ʺţ�');window.history.back(-1);</script>"
end if   
rs.close
set rs=nothing
conn.close
%>