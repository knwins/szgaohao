<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
'----------------------------------------------------------------
' ��ȡ�����Ͳ���
'----------------------------------------------------------------
Function ReqNum ( StrName )
    ReqNum = Request ( StrName )
    if not isNumeric ( ReqNum ) then
        response.write "��������Ϊ������!"
        response.end
    end if
End Function

'----------------------------------------------------------------
' ��ȡ�ַ��Ͳ���
'----------------------------------------------------------------
Function ReqStr ( StrName )
    ReqStr = Replace ( Request(StrName), "'", "''" )
End Function

session("id")=request.form("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from site where id="&session("id")
rs.open sql,conn,3,2
	rs("title")=request.form("title")
	rs("key")=request.form("key")
	rs("description")=request.form("description")
	rs("url")=request.form("url")
	rs("site")=request.form("site")
rs.update
%>
<SCRIPT LANGUAGE="JavaScript">

  window.alert("�ѳɹ��޸ĸü�¼��");
  window.location.href="site.asp?id=<%=session("id")%>";

</SCRIPT>