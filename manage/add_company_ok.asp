<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%  
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from company"
	rs.open sql,conn,3,2
	rs.addnew
	rs("cname")=trim(request("cname")) '��Ʒ����
	'rs("contenttitle")=trim(request("contenttitle"))
	'rs("name")=trim(request("name"))'���ɾ�̬ҳ��ʹ�õ�
	rs("title")=trim(request("title"))
	rs("key")=trim(request("key"))
	rs("description")=trim(request("description"))
	rs("content")=trim(request("content"))
	rs("ver")=session("ver")
	rs.update
%>
<SCRIPT LANGUAGE="JavaScript">
  window.alert("��ӳɹ���");
  window.location.href="company.asp?cname=<%=cname%>";
</SCRIPT>
