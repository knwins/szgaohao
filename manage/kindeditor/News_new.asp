<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<html>
<head>
<title>后台数据管理中心</title>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
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
</head>
<body bgcolor="#ffffff" leftmargin=0 topmargin=0 >
<br>
<table border="1" width="90%" align="center" bordercolorlight="#c0c0c0" cellspacing="1" cellpadding="3" bordercolordark="#ffffff" >
  <form name="frmsubmit" action=News_add.asp method=post>
    <tr>
      <td width="20%">序号：</td>
      <td width="80%"><input name=orders size="40" value="0">
        <font color=red>（必须为数字，数字越小越靠前）</font></td>
    </tr>
    <tr>
      <td width="20%">新闻标题：</td>
      <td width="80%"><input name=product_name id="product_name" size="60"></td>
    </tr>
    <tr>
      <td width="20%">类别：</td>
      <td width="80%"><select name="types">
          <%call showtype()%>
        </select>
      </td>
    </tr>
    <tr align="center">
      <td>内容：</td>
       <td align=left valign="top" class="unnamed2" bgcolor="#ffffff"><textarea name="content" style="width:700px;height:450px;visibility:hidden;"><%=CONTENT%></textarea></td>
    </tr>
    <tr>
      <td class="font" height="28" width="20%" colspan="2" ><p align="center">
          <input type="submit" name="add" value=" 添加 " >
          <input type="reset" name="reset" value=" 重写 ">
      </td>
    </tr>
  </form>
</table>
</body>
</html>
<%
sub showtype()
	set rscate=server.createobject("adodb.recordset")
	rscate.open "select * from news_cate where ver='"&session("ver")&"' order by listorder asc",conn,1
	while not rscate.eof
		str1="<option value="""& rscate("id") & """>" & rscate("typename") & "</option>"
		response.write str1
		rscate.movenext
	wend 
	rscate.close
	set rscate=nothing
end sub
%>


