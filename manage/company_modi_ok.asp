<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
id=request("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from company where id="&id
rs.open sql,conn,3,2
    types=trim(request("typename")) '�����������
	'rs("contenttitle")=trim(request("contenttitle"))
    stype=trim(request("stypename")) '�����������    
	rs("cname")=trim(request("cname")) '��Ʒ����
	'rs("name")=trim(request("name"))
	rs("title")=trim(request("title"))
	rs("key")=trim(request("key"))
	rs("description")=trim(request("description"))
	rs("content")=trim(request("content"))
rs.update
%>
<SCRIPT LANGUAGE="JavaScript">

  window.alert("�ѳɹ��޸ĸü�¼��");
  window.location.href="company.asp?topage=<%=request("topage")%>";

</SCRIPT>