<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<html>
<head>
<title>��̨���ݹ�������</title>
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
		window.alert("����Ʒ���ơ�����Ϊ�գ�");
		document.myform.PRODUCT_NAME.onfocus;
		return (false);
	}
	if (document.myform.ORDERS.value==""){
		window.alert("����š�����Ϊ�գ�");
		document.myform.ORDERS.onfocus;
		return (false);
	}
	return(true);
}
//-->
</SCRIPT>

</head>
<body bgcolor="#FFFFFF" leftmargin=0>
<table width="90%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" >
              <form name="myform" action=Product_add.asp method=post onSubmit="return checkform();">
                <tr>
                  <td width="161">��ţ�</td>
                  <td width="562">
                  	<input name=ORDERS size="40" value="0" onKeyUp="value=value.replace(/\D+/g,'')">
                  	<font color=red>������Ϊ���֣�����Խ��Խ��ǰ��</font></td>
				</tr>
                <tr>                   
                  <td width="161">��Ʒ���ƣ�</td>
                  <td width="562"><input name=PRODUCT_NAME size="40"></td>
				</tr>
                <tr>
                  <td width="161">��ƷСͼƬ��</td>
                  <td width="562">
                  <input name=s_image size=35 maxlength=50 value="">
                  <input name="Submit" type="button" onClick="window.open('../upload_flash.asp?formname=myform&editname=s_image&uppath=pro_img/s&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="Сͼ">
                  <font color=red>��ע����֧����������С��200KB��</font>                  </td>
  				</tr>
				                <tr>
                  <td width="20%">��Ʒ��ͼƬ��</td>
                  <td width="80%">
                  <input name=B_IMAGE size=35 maxlength=50 value="">
                  <input name="Submit" type="button" onClick="window.open('../upload_flash.asp?formname=myform&editname=B_IMAGE&uppath=pro_img/b&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="��ͼ">
                  <font color=red>��ע����֧����������С��400KB��</font></td> 
				</tr>
                <tr>
                  <td width="161">���</td>
                  <td width="562">
                  <SELECT name="TYPES"><%call showtype()%></SELECT>                  </td>
				</tr>
  							

                <tr>
                  <td width="161">�Ƿ��Ƽ���Ʒ��</td>
                  <td width="562"><input type="checkbox" name=COMMEND value="checkbox">                    
                  �������Ƿ����Ƽ���Ʒ����ʾ��</td>
				</tr>
  							
								<tr align="center"> 
                  <td>���ݣ�</td>
                  <td width="562" align=left valign="top" class="unnamed2"> 
                    <textarea name="content" style="width:700px;height:450px;visibility:hidden;"><%=CONTENT%></textarea></td>
                </tr>
                
                <tr>              
                  <td height="28" colspan="2" class="font" >    
                    <p align="center">   
                    <input type="submit" name="add" value=" ��� " >
                    <input type="reset" name="reset" value=" ��д ">
                  </td>     
                </tr>            
              </form>             
</table>       
<span class="unnamed2">
<input type="hidden" name="content">
</span>
</body>       
</html>       
<%
sub showtype()
	set rscate=server.CreateObject("ADODB.RecordSet")
	rscate.open "select * from product_cate WHERE ver='"&session("ver")&"' and ROOT_ID=0 order by listorder ASC",conn,1
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
			if rschiled("pro_cate_id") =search2 then
				str1="<option value="""& rschiled("pro_cate_id") &  """selected>" 
			else
				str1="<option value="""& rschiled("pro_cate_id") &  """>" 
			end if
			call list(rschiled("Pro_Cate_Name"), str1,level)
			call Getchiled(rschiled("pro_cate_id"),(level+1))
			rschiled.movenext
		wend
		set rschiled=nothing
end sub
sub	list(catename, str,level)
		dim space
		for i=1 to level
			space=space+"��"
		next
		str2=catename & "</option>"
		str=str & space & str2
		Response.Write str
end sub
%>