<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<% 
	cateid  = replace(Request("cateid"),"'","")
	typename_cate=trim(Request("typename_cate"))
	ListOrder=trim(Request("ListOrder"))
	mode=Request("mode")
	set rs=server.CreateObject("ADODB.RecordSet")
	set rschild=server.CreateObject("ADODB.RecordSet")

	if mode="Edit" then
		sql = "update news_cate set typename = '"&typename_cate&"', ListOrder = '"&ListOrder&"' "
		sql = sql & "where id = "&cint(cateid)
		Response.Write sql
		conn.Execute (sql)
		Response.Redirect "NewsCate_List.asp?ver="&session("ver")&""
	end if
	
	if mode="Del" then	
			'---------------���������Ƿ��в�Ʒ-------------------
			rschild.open "select * from news WHERE type= "& cateid &" order by product_id desc" ,conn,1
			if not rschild.eof then
				Response.Write "<script>"
				Response.Write "window.alert('�����������������Ϣ������ɾ��������ɾ��������µ�������Ϣ��');"
				Response.Write "history.back();"
				Response.Write "</script>"
				Response.End 
			else
				sql = "delete * from news_cate where id = "&cateid
				Response.Write sql
		  	conn.Execute (sql)
		  end if
	  	rschild.close
			set rschild=nothing
			Response.Redirect "NewsCate_List.asp?ver="&session("ver")&""		
	end if 
	
	rs.open "select * from news_cate WHERE id= "&cateid &" order by ListOrder desc" ,conn,1
%>
<HTML>
<HEAD><SCRIPT LANGUAGE=javascript>
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

<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
</HEAD>
<BODY>
      <strong><font color="#000000">�����������</font></strong> <br>
      <br>
      ����ѡ�<a href="NewsCate_New.asp">������Ŵ���</a><br>
      <br>
			<FORM action="NewsCate_Edit.asp" method=POST name=form1>
    	<table width="414" border="0" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#4296CE" class="title"> 
          <td width="160" height="25" align="center"><strong><font color="#FFFFFF">��Ŀ����</font></strong></td>
          <td width="251" height="20" align="center"><strong><font color="#FFFFFF">����ѡ��</font></strong></td>
        </tr>
				<tr bgcolor="#eeeeee" class="tdbg"> 
					<TD width="32%">����</TD>
					<TD width="68%"> <INPUT type="text"  name="ListOrder" value="<%=rs("ListOrder")%>" onKeyUp="value=value.replace(/\D+/g,'')"></TD>
				</TR>
	      <tr bgcolor="#eeeeee" class="tdbg"> 
					<TD width=32%>�������</TD>
					<TD width="68%"> <INPUT type="text" name="typename_cate" size=40 maxlength=100 value="<%=rs("typename")%>">&nbsp;&nbsp;</TD>
				</TR>
			</TABLE>
			<input type="hidden" name="mode">
			<input type="hidden" name="cateid" value="<%=cateid%>"><p>
		  <INPUT type="submit" value="�� ��" name=submit1 onClick="return checkfrom('Edit');"> &nbsp &nbsp
		  <INPUT type="button" value="�� ��"  name=button1 onClick="javascript:history.back(-2) ;">
			</FORM>
<%
	rs.close
	set rs=nothing
%>
</body>
</html>
