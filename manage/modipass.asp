<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->

<%
set rs=server.createobject("adodb.recordset")
rs.open "select pass from admin where zh='"&session("zh")&"' ",conn,3
pass=rs(0)
rs.close

if request("newpass")<>"" then
  conn.execute "update admin set pass='"&request("newpass")&"' where zh='"&session("zh")&"' "
  response.write "<script>alert('"&session("xm")&"����������Ѿ��޸ĳɹ���');window.location.href='face.asp'</script>"
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
.style1 {color: #FFFFFF}
-->
</style></head>

<script language=javascript>
function aa(){
if (document.all.item("oldpass").value=="")
	{
	  alert("����������룡")
	  document.all.item("oldpass").focus()
	  return false
	 }
	 
if (document.all.item("oldpass").value!="<%=pass%>")
	{
	  alert("����ľ����벻��ȷ��")
	  document.all.item("oldpass").focus()
	  return false
	 }
	 
if (document.all.item("newpass").value=="")
	{
	  alert("�����������룡")
	  document.all.item("newpass").focus()
	  return false
	 }
	 
if (document.all.item("newpass1").value!=document.all.item("newpass").value)
	{
	  alert("��������������벻һ����")
	  document.all.item("newpass1").focus()
	  return false
	 }	  
}
</script>
<body>
<table width="100%" height="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="96%" border="0" cellspacing="0" cellpadding="0" align="center" height="6">
      <tr>
        <td width="701" height="35" valign="middle"><font color="#FF0000">��ǰλ�ã������޸�</font></td>
      </tr>
      <tr> 
      <td height="1" bgcolor="#000000"></td>
  </tr>
</table>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <table width="500" border="0">
	<form action="modipass.asp" method="post" name="form1" onSubmit="return aa()">
      <tr align="center" bgcolor="006699">
        <td height="25" colspan="2"><span class="style1">�޸�����</span></td>
      </tr>
      <tr bgcolor="#F6F6F6">
        <td height="25" align="right" bgcolor="#F6F6F6">�ɡ��ܡ��룺</td>
        <td><input name="oldpass" type="password" class="text" id="oldpass" size="20"></td>
      </tr>
      <tr bgcolor="#F6F6F6">
        <td height="25" align="right" bgcolor="#F6F6F6">�¡��ܡ��룺</td>
        <td height="25"><input name="newpass" type="password" class="text" id="newpass" size="20"></td>
      </tr>
      <tr bgcolor="#F6F6F6">
        <td height="25" align="right" bgcolor="#F6F6F6">ȷ�������룺</td>
        <td height="25"><input name="newpass1" type="password" class="text" id="newpass1" size="20"></td>
      </tr>
      <tr align="center" bgcolor="#F6F6F6">
        <td height="35" colspan="2"><input name="imageField" type="image" src="images/submit.gif" width="72" height="21" border="0"></td>
      </tr>
	  </form>
    </table></td>
  </tr>
</table>
</body>
</html>
<%
set rs=nothing
conn.close
%>