<%
if session("userlogin")="" then
 response.write "<script>alert('���¼�ѳ�ʱ��');window.parent.location.href='login.asp';</script>"
end if
%>