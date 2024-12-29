<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<% 
	dim rs, product_id, PRODUCT_NAME, CONTENT, INTRO, COMMEND, ORDERS
	product_id  = replace(Request("id"),"'","")
	set rs=server.CreateObject("ADODB.RecordSet")
	rs.open "select * from product where product_id = "& product_id &" order by orders,createdate desc",conn,1
	PRODUCT_NAME = rs("PRODUCT_NAME")
	CONTENT      = rs("CONTENT")
	ORDERS       = rs("ORDERS")
	INTRO        = rs("INTRO")
	COMMEND      = rs("COMMEND")
	S_IMAGE      = rs("S_IMAGE")
	B_IMAGE      = rs("B_IMAGE")
	TYPES        = rs("TYPE")
	rs.close
	set rs = nothing
%>
<html>
<head>
<title>后台管理系统</title>
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
<SCRIPT LANGUAGE=JAVASCRIPT>
<!--
	function checkform() {
		if (document.myform.PRODUCT_NAME.value==""){
			window.alert("“产品名称”不能为空！");
			document.myform.PRODUCT_NAME.onfocus;
			return (false);
		}
		if (document.myform.ORDERS.value==""){
			window.alert("“编号”不能为空！");
			document.myform.ORDERS.onfocus;
			return (false);
		}
		
		return true
	}
//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" >
<table border="1" width="90%" align="center" bordercolorlight="#C0C0C0" cellspacing="1" cellpadding="3" bordercolordark="#FFFFFF" >
              <form name="myform" action=Product_upd.asp method=post onSubmit="return checkform();">
              <input type=hidden name="product_id" value="<%=product_id%>">
                <tr>
                  <td>编号：</td>
                  <td>
                  	<input name=ORDERS size="40" value="<%=ORDERS%>" onKeyUp="value=value.replace(/\D+/g,'')">
                  	<font color=red>（必须为数字，数字越大越靠前）</font>
                  </td>
				</tr>
                <tr>
                  <td width="20%">产品名称：</td>
                  <td width="80%"><input name=PRODUCT_NAME size="40" value="<%=PRODUCT_NAME%>"></td>
				</tr>
          <tr>
                  <td width="161">产品小图片：</td>
            <td width="562">
              <input name=s_image size=35 maxlength=50 value="<%=S_IMAGE%>">
              <input name="Submit" type="button" onClick="window.open('../upload_flash.asp?formname=myform&editname=s_image&uppath=pro_img/s&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="小图">
                  <font color=red>（注：不支持中文名且小于200KB）</font>                  </td>
  				</tr>
				                <tr>
                  <td width="20%">产品大图片：</td>
                  <td width="80%">
                  <input name=B_IMAGE size=35 maxlength=50 value="<%=B_IMAGE%>">
                  <input name="Submit" type="button" onClick="window.open('../upload_flash.asp?formname=myform&editname=B_IMAGE&uppath=pro_img/b&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="大图">
                  <font color=red>（注：不支持中文名且小于400KB）</font></td> 
				</tr>
                <tr>
                  <td width="20%">类别：</td>
                  <td width="80%">
                  <SELECT name="types"><%call showtype(cint(types))%></SELECT>
                  </td>
				</tr>
				  <tr>
                  <td width="161">是否推荐产品：</td>
                  <td width="562"><%if COMMEND=1 then %><input name=COMMEND type="checkbox" value="checkbox" checked><%else%>                    <input name=COMMEND type="checkbox" value="checkbox"><%end if%>
                  （决定是否在推荐产品中显示）</td>
				</tr>
              <tr align="center"> 
                  <td>内容：</td>
                  <td align=left valign="top" class="unnamed2" bgcolor="#FFFFFF"> 
            <textarea name="content" style="width:700px;height:450px;visibility:hidden;"><%=CONTENT%></textarea>
                  </td>
                </tr>
                 
                <tr>              
                  <td class="font" height="28" width="1172" colspan="2" >    
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
sub showtype(cateid)	
	set rscate=server.CreateObject("ADODB.RecordSet")
	rscate.open "select * from product_cate WHERE ver='"&session("ver")&"' and ROOT_ID=0 order by listorder ASC",conn,1
 
	if rscate("Pro_Cate_ID") = cateid then
	str3="<option value="""& rscate("Pro_Cate_ID") &  """selected>" & rscate("Pro_Cate_Name") & "</option>"
	else
	set rscates=server.CreateObject("ADODB.RecordSet")
	rscates.open "select * from product_cate where ver='"&session("ver")&"' and pro_cate_id="&cateid&" order by listorder ASC",conn,1
	str3="<option value="""&rscates("pro_cate_id")&""" selected>&nbsp;&nbsp;" & rscates("Pro_Cate_Name") & "</option>"
	rscates.close
	set rscates=nothing
	end if
	response.Write str3
	
	while not rscate.eof	
	str1="<option value="""& rscate("pro_cate_id") & """>" & rscate("Pro_Cate_Name") & "</option>"
	Response.Write str1
		call Getchiled(rscate("pro_cate_id"),1) 
		rscate.movenext
	wend 
	set rscate=nothing
	
end sub

sub	GetChiled(cateid,level)
		set rschiled=server.CreateObject("ADODB.RecordSet")
		rschiled.open "select * from product_cate WHERE ver='"&session("ver")&"' and ROOT_ID="&cateid&" order by listorder ASC",conn,1
		while not rschiled.eof
			if rschiled("pro_cate_id") = cateid then
				str1="<option value="""& rschiled("pro_cate_id") &  """selected>" 
			else
				str1="<option value="""& rschiled("pro_cate_id") &  """>" 
			end if
			call list(rschiled("pro_cate_name"), str1,level)
			call Getchiled(rschiled("pro_cate_id"),(level+1))
			rschiled.movenext
		wend
		set rschiled=nothing
end sub
sub	list(catename, str,level)
		dim space
		for i=1 to level
			space=space+""
		next
		str2=catename & "</option>"
		str=str & space & str2
		Response.Write str
end sub
%>
<%CloseDatabase%>