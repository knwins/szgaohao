<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
dim rs_pro,sqlpro
sqlpro="select * from company where id="&request("id")
Set rs_pro= Server.CreateObject("ADODB.Recordset")
rs_pro.open sqlpro,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
<!--kindeditor starts-->
<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
<script>
var editor;
		
	KindEditor.ready(function(K) {
	
	//editor start
	var editor = K.create('textarea[name="content"]', {
	cssPath: 'kindeditor/plugins/code/prettify.css',
	uploadJson: 'kindeditor/upload_json.asp',
	fileManagerJson: 'kindeditor/file_manager_json.asp',
	allowFileManager: true,
	afterBlur: function(){this.sync();}
	});
    //editor end
	
	//prettyPrint()
	});

	</script>
<!--kindeditor end-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>
<script language=javascript>
function add() {
 
	 if (document.myform.cname.value=="")
	{
	  alert("������ҳ�����ƣ�")
	  document.myform.cname.focus()
	  return false
	 } 
	 if (document.myform.name.value=="")
	{
	  alert("������ҳ���ļ����ƣ�")
	  document.myform.name.focus()
	  return false
	 }  	
	  if (document.myform.title.value=="")
	{
	  alert("������ҳ����⣡")
	  document.myform.title.focus()
	  return false
	 }
	 
if (document.myform.key.value=="")
	{
	  alert("������ҳ��ؼ��֣���")
	  document.myform.key.focus()
	  return false
	 } 
	 if (document.myform.description.value=="")
	{
	  alert("������ҳ��˵������")
	  document.myform.description.focus()
	  return false
	 }  
}
</script>
<body>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="35"><font color="#FF0000">��ǰλ�ã�<%=request("nbmc")%> --����ҵ��Ϣ������</font>������<font color="#FF0000">*</font>��Ϊ����� </td>
  </tr>
</table>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1">
  <form action="company_modi_ok.asp" method="post" name="myform" onSubmit="return add()" >
    <TR>
      <TD HEIGHT="1" COLSPAN="2"></TD>
    </TR>
    <tr>
      <td width="15%" height="28" align="right">��Ŀ���ƣ�</td>
      <td width="85%" height="28"><input name="cname" type="text" id="cname" value="<%=rs_pro("cname")%>"  size="45" maxlength="50" >
          <font color="#FF0000">*</font></td>
    </tr>
    <tr>
      <!--<td height="28" align="right">��Ŀ�ļ�����</td>
      <td height="28"><input name="name" type="text" id="name" value="<%'=rs_pro("name")%>" size="12">
          <font color="#FF0000">*</font></td> -->
    </tr>
    <tr>
      <td height="28" align="right">��վ���ݱ��⣺</td>
      <td height="28"><input name="title" type="text" id="title" value="<%=rs_pro("title")%>" size="40" maxlength="100"></td>
    </tr>
    <tr>
      <td height="28" align="right">SEOҳ��ؼ��֣�</td>
      <td height="28"><input name="key" type="text" id="key" value="<%=rs_pro("key")%>" size="50">
          <font color="#FF0000">*</font></td>
    </tr>
    <tr>
      <td height="28" align="right">SEOҳ��˵����</td>
      <td height="28"><textarea name="description" cols="50" rows="3" id="description"><%=rs_pro("description")%></textarea></td>
    </tr>
    <tr>
      <td height="28" align="right">ҳ�����ݣ�</td>
      <td height="28"><textarea name="content" style="width:700px;height:450px;visibility:hidden;"><%=rs_pro("content")%></textarea>
        </td>
    </tr>
    <tr align="center">
      <td height="28" colspan="2"></td>
    </tr>
    <tr>
      <td height="40" colspan="2" align="center"><input type="hidden" value="<%=rs_pro("id")%>" name="id"><input type="hidden" value="<%=request("topage")%>" name="topage"><input name="image" type="image" src="images/submit.gif" width="72" height="21">
          <img src="images/back.jpg" width="72" height="21" onClick="history.go(-1)"></td>
    </tr>
  </form>
</table>
</body>
</html>
<%
rs_pro.close
set rs_pro=nothing
conn.close
%>
