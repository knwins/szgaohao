<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
	rootid  = replace(Request("rootid"),"'","")
	cateid  = replace(Request("cateid"),"'","")
	'response.write rootid&"<br>"
	'response.write cateid&"<br>"
	ProName=trim(Request("ProName"))
	ListOrder=trim(Request("ListOrder"))
	mode=Request("mode")
	
	set rs=server.CreateObject("ADODB.RecordSet")
	set rschild=server.CreateObject("ADODB.RecordSet")

	if mode="Edit" then
		sql = "update product_cate set PRO_CATE_NAME = '"&proname&"', ListOrder = '"&ListOrder&"' "
		sql = sql & "where pro_cate_id = "&cint(cateid)
		Response.Write sql
		conn.Execute (sql)
		Response.Redirect "Product_Cate_List.asp"
	end if
	
	if mode="Del" then
		'---------------�����û�������-------------------
		rs.open "select * from product_cate WHERE parent_id= "&cateid &" and root_id= "&cateid &" " ,conn,1
		if not rs.eof then
			rsError = 1
			Response.Write "<script>"
			Response.Write "window.alert('��������������࣬����ɾ��������ɾ�������');"
		 	Response.Write "history.back();"
			Response.Write "</script>"
			Response.End 
			Response.Redirect "Product_Cate_List.asp"
		else
			'---------------���������Ƿ��в�Ʒ-------------------
			rschild.open "select * from product WHERE type= "& cateid &" order by product_id desc" ,conn,1
			if not rschild.eof then
				Response.Write "<script>"
				Response.Write "window.alert('����������в�Ʒ������ɾ��������ɾ��������µĲ�Ʒ��');"
				Response.Write "history.back();"
				Response.Write "</script>"
				Response.End 
			else
				sql = "delete * from product_cate where PRO_CATE_ID = "&cateid
				Response.Write sql
		  	conn.Execute (sql)
		  end if
			rschild.close
			set rschild=nothing
		  '---------------���������Ƿ��в�Ʒ-------------------
			Response.Redirect "Product_Cate_List.asp"
		end if
		'---------------�����û�������-------------------
	end if 
	
	rs.open "select * from product_cate WHERE pro_cate_id= "&cateid &" order by pro_cate_id desc" ,conn,1
%>
<HTML>
<HEAD>
<SCRIPT LANGUAGE=javascript>
<!--
	function checkfrom(mode)
	{
		if (mode=="Edit")
		{
			form1.mode.value=mode;
			return true;
		}
		else
		{
			temp=window.confirm("ȷ��Ҫɾ���������")
			if (temp)
			{
				form1.mode.value=mode;
				return true;
			}
			return false;
		}
	}
//-->
</SCRIPT>
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
</HEAD>
<BODY>
<h3 align="center">��Ʒ������ù���</h3>
<strong><font color="#000000">��Ʒ�������</font></strong> <br>
<br>
����ѡ�<a href="Product_Cate_New.asp?cateid=0&rootid=0">��Ӳ�Ʒ����</a><br>
<br>
<FORM action="Product_Cate_Edit.asp" method=POST name=form1>
  <table width="414" border="0" cellpadding="0" cellspacing="2" class="border">
    <tr bgcolor="#4296CE" class="title">
      <td width="160" height="25" align="center"><strong><font color="#FFFFFF">���</font></strong></td>
      <td width="251" height="20" align="center"><strong><font color="#FFFFFF">ѡ��</font></strong></td>
    </tr>
    <tr bgcolor="#eeeeee" class="tdbg">
      <TD width="32%">����</TD>
      <TD width="68%"><INPUT type="text"  name="ListOrder" value="<%=rs("ListOrder")%>" onKeyUp="value=value.replace(/\D+/g,'')"></TD>
    </TR>
    <tr bgcolor="#eeeeee" class="tdbg">
      <TD width=32%>�������</TD>
      <TD width="68%"><INPUT type="text" name="ProName" size=40 maxlength=100 value="<%=rs("Pro_Cate_Name")%>">
        &nbsp;&nbsp;</TD>
    </TR>
  </TABLE>
  <input type="hidden" name="mode">
  <input type="hidden" name="cateid" value="<%=cateid%>">
  <p>
    <INPUT type="submit" value="�� ��" name=submit1 onClick="return checkfrom('Edit');">
    <INPUT type="button" value="�� ��"  name=button1 onClick="javascript:history.back(-2) ;">
</FORM>
<%
	rs.close
	set rs=nothing
%>
</body>
</html>
