<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->

<%
	session("loginid")
	cateid=Request("cateid")
	ver=session("ver")
	typename_cate=trim(Request("typename_cate"))
	mode=Request("mode")
	
    if mode="add" then
	  	sql = "insert into news_cate(typename, listorder,ver) "
	  	sql = sql & "values ('"&typename_cate&"', '0','"&ver&"')"
  
	    Response.Write sql
		conn.Execute (sql)
		Response.Redirect "NewsCate_List.asp?ver="&ver&""
	end if
%>

<HTML>
<HEAD><SCRIPT LANGUAGE=javascript>
<!--
	function checkfrom()
	{	var typename_cate=form1.typename_cate.value;
		if (typename_cate=="" || typename_cate.indexOf("'")>=0)
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
      <strong><font color="#000000">�����������</font></strong> <br>
      <br>
      ����ѡ�<a href="NewsCate_New.asp">������Ŵ���</a><br>
      <br>

			<FORM action="NewsCate_New.asp" method=POST name=form1>
			<table width="414" border="0" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#4296CE" class="title"> 
          <td width="160" height="25" align="center"><strong><font color="#FFFFFF">��Ŀ����</font></strong></td>
          <td width="251" height="20" align="center"><strong><font color="#FFFFFF">����ѡ��</font></strong></td>
        </tr>
				<tr bgcolor="#eeeeee" class="tdbg"> 
					<TD width="32%">����</TD>
					<TD width="68%"> <INPUT type="text" value=0 name="ListOrder" onKeyUp="value=value.replace(/\D+/g,'')"></TD>
				</TR>
	      <tr bgcolor="#eeeeee" class="tdbg"> 
					<TD width=32%>�������</TD>
					<TD width="68%"> <INPUT name="typename_cate" type="text" id="typename_cate" size=40 maxlength=100></TD>
				</TR>
			</TABLE>
			<input type="hidden" name="mode" value="add">
			<input type="hidden" name="cateid" value="<%=cateid%>"><p>
		  <INPUT type="submit" value="�� ��" name=submit1 onClick="return checkfrom();"> &nbsp &nbsp
		  <INPUT type="button" value="�� ��"  name=button1 onClick="javascript:history.back() ;">
			</FORM>
</BODY>
</HTML>
