<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
	session("loginid")
	cateid=Request("cateid")
	rootid=Request("rootid")
	ProName=trim(Request("ProName"))
	ListOrder=trim(Request("ListOrder"))
	mode=Request("mode")
	
    if mode="add" then
	  	sql = "insert into product_cate(PARENT_ID, ROOT_ID, PRO_CATE_NAME, LISTORDER,ver) "
	  	sql = sql & "values ('"&cateid&"' , '"&rootid&"', '"&ProName&"', '"&ListOrder&"','"&session("ver")&"')"
  
	    Response.Write sql
		conn.Execute (sql)
		Response.Redirect "Product_Cate_List.asp"
	end if
%>

<HTML>
<HEAD><SCRIPT LANGUAGE=javascript>
<!--
	function checkfrom()
	{	var ProName=form1.ProName.value;
		if (ProName=="" || ProName.indexOf("'")>=0)
		{
			window.alert("��Ʒ���������Ϊ�գ������������ַ���");
			return false;
		}
		return true;
	
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
		<FORM action="Product_Cate_New.asp" method=POST name=form1>
		<table width="414" border="0" cellpadding="0" cellspacing="2" class="border">
    	<tr bgcolor="#4296CE" class="title"> 
        <td width="160" height="25" align="center"><strong><font color="#FFFFFF">���</font></strong></td>
        <td width="251" height="20" align="center"><strong><font color="#FFFFFF">ѡ��</font></strong></td>
      </tr>
      <tr bgcolor="#eeeeee" class="tdbg"> 
				<TD width="32%">����</TD>
				<TD width="68%"> <INPUT type="text" value=0 name="ListOrder" onKeyUp="value=value.replace(/\D+/g,'')"></TD>
			</TR>
      <tr bgcolor="#eeeeee" class="tdbg">  
				<TD width=32%>�������</TD>
				<TD width="68%"> <INPUT type="text" name="ProName" size=40 maxlength=100>&nbsp;&nbsp;</TD>
			</TR>
		</TABLE>
		<input type="hidden" name="mode" value="add">
		<input type="hidden" name="rootid" value="<%=rootid%>">
		<input type="hidden" name="cateid" value="<%=cateid%>"><p>
  	<INPUT type="submit" value="�� ��" name=submit1 onClick="return checkfrom();"> &nbsp &nbsp
  	<INPUT type="button" value="�� ��"  name=button1 onClick="javascript:history.back() ;">
</FORM>
</BODY>
</HTML>

<%CloseDatabase%>