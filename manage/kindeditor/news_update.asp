<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<% 
	dim rs, product_id, product_name, content, intro, commend, orders
	product_id  = replace(request("id"),"'","")
	session("page")=request("page")
	set rs=server.createobject("adodb.recordset")
	rs.open "select * from news where product_id = "& product_id &" order by orders,createdate desc",conn,1
	product_name = rs("product_name")
	content      = rs("content")
	orders       = rs("orders")
	types        = rs("type")
	createdate   = rs("createdate")
	rs.close
	set rs = nothing
%>
<html>
<head>
<title>后台管理系统</title>
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
<body bgcolor="#ffffff" leftmargin=0 topmargin=0>
<br>
<table border="1" width="90%" align="center" bordercolorlight="#c0c0c0" cellspacing="1" cellpadding="3" bordercolordark="#ffffff" >
  <form name="frmsubmit" action=News_upd.asp method=post>
    <input type=hidden name="product_id" value="<%=product_id%>">
    <tr>
      <td>序号：</td>
      <td><input name=orders size="40" value="<%=orders%>">
          <font color=red>（必须为数字，数字越小越靠前）</font></td>
    </tr>
    <tr>
      <td width="20%">新闻标题：</td>
      <td width="80%"><input name=product_name size="60" value="<%=product_name%>"></td>
    </tr>
    <tr>
      <td width="20%">类别：</td>
      <td width="80%"><select name="types">
        <%call getchiled(cint(types),1)%>
      </select>      </td>
    </tr>
    <tr align="center">
      <td>内容：</td>
      <td align=left valign="top" class="unnamed2" bgcolor="#ffffff">
       <textarea name="content" style="width:700px;height:450px;visibility:hidden;"><%=CONTENT%></textarea>
      </td>
    </tr>
    <tr>
      <td class="font" height="28" width="20%" colspan="2" >
	  <p align="center">
        <input type="submit" name="add" value=" 修改 " >
        <input type="button" name="back" value=" 返回 " onClick="history.back();">
      </td>
    </tr>
  </form>
</table>
</body>       
</html>

<%
sub	getchiled(cateid,level)
		set rschiled=server.createobject("adodb.recordset")
		rschiled.open "select * from news_cate where ver='"&session("ver")&"' order by listorder desc",conn,1
		while not rschiled.eof
			if rschiled("id") = cateid then
				str1="<option value="""& rschiled("id") &  """selected>" 
			else
				str1="<option value="""& rschiled("id") &  """>" 
			end if
			call list(rschiled("typename"), str1,level)
			rschiled.movenext
		wend
		rschiled.close
		set rschiled=nothing
end sub

sub	list(catename, str,level)
		dim space
		for i=1 to level
			space=space+""
		next
		str2=catename & "</option>"
		str=str & space & str2
		response.write str
end sub
%>
