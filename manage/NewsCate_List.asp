<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%  session("ver")=request("ver")
	set rs=server.createobject("adodb.recordset")
	rs.open "select * from news_cate where ver='"&session("ver")&"' order by listorder asc",conn,1
%>
<html>
<head>
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
<style>
body,td,p,select,input{font-size:10pt}
a:link
{
    color:blue;
    font-family: ����;
    text-decoration: none
    font-size: 10pt;
}
</style>
<title>����������</title>
<script language="javascript" type="text/javascript">
function confirmdelbig()
{
   if(confirm("ȷ��Ҫɾ�������𣿴˲��������棡"))
     return true;
   else
     return false;
}
</script>
</head>
<body>

      <strong><font color="#000000">�����������</font></strong> <br>
      <br>
      ����ѡ�<a href="newscate_new.asp">������Ŵ���</a><br>
      <br>
      <table width="414" border="0" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#4296ce" class="title"> 
          <td width="160" height="25" align="center"><strong><font color="#ffffff">��Ŀ����</font></strong></td>
          <td width="251" height="20" align="center"><strong><font color="#ffffff">����ѡ��</font></strong></td>
        </tr>
<%
  while not rs.eof 
  	dim space
		cateid = rs("id")
		catename = rs("typename")
%>
        
        <tr bgcolor="#eeeeee" class="tdbg"> 
          <td width="160" height="22">
          	<img src="images/tree_folder4.gif" width="15" height="15">
          	<a href="newscate_edit.asp?cateid=<%=cateid%>"><%=catename%></a>
          </td>
          <td align="right">
							<a href="newscate_edit.asp?cateid=<%=cateid%>">�޸�</a> 
            | <a href="newscate_edit.asp?mode=Del&cateid=<%=cateid%>" onclick="return confirmdelbig();">ɾ��</a>
          </td>
        </tr>
<%
		rs.movenext
  wend
  rs.close
  set rs=nothing
%>        
        
    </table>

</body>
</html>

