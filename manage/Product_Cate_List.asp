<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%
if session("ver")="" or  request("ver")="cn" or request("ver")="en" then
      session("ver")=request("ver")
	end if
	set rs=server.CreateObject("ADODB.RecordSet")
	rs.open "select * from product_cate WHERE ver='"&session("ver")&"' and ROOT_ID=0 order by listorder asc",conn,1
%>
<HTML>
<HEAD>
<TITLE>��Ʒ������</TITLE>
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
<script language="JavaScript" type="text/JavaScript">
function ConfirmDelBig()
{
   if(confirm("ȷ��Ҫɾ�������𣿴˲��������棡"))
     return true;
   else
     return false;
}
</script>
</HEAD>
<BODY>
			<h3 align="center">��Ʒ������ù���</h3>
      <strong><font color="#000000">��Ʒ�������</font></strong> <br>
      <br>
      ����ѡ�<a href="Product_Cate_New.asp?cateid=0&rootid=0">��Ӳ�Ʒ����</a><br>
      <br>
      <table width="414" border="0" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#4296CE" class="title"> 
          <td width="160" height="25" align="center"><strong><font color="#FFFFFF">��Ŀ����</font></strong></td>
          <td width="251" height="20" align="center"><strong><font color="#FFFFFF">����ѡ��</font></strong></td>
        </tr>
<%
  while not rs.eof 
  	dim space
		cateid = rs("PRO_CATE_ID")
		catename = rs("PRO_CATE_NAME")
%>
        
        <tr bgcolor="#eeeeee" class="tdbg"> 
          <td width="160" height="22">
          	<img src="images/tree_folder4.gif" width="15" height="15">
          	<A HREF="Product_Cate_Edit.asp?cateid=<%=cateid%>"><%=catename%></a>
          </td>
          <td align="right">
          		<A HREF='Product_Cate_New.asp?cateid=<%=cateid%>&catename=<%=catename%>&rootid=<%=cateid%>'>�������Ŀ</a> 
            | <A HREF="Product_Cate_Edit.asp?cateid=<%=cateid%>">�޸�</a> 
            | <a href="Product_Cate_Edit.asp?mode=Del&rootid=<%=rs("Parent_ID")%>&cateid=<%=cateid%>" onClick="return ConfirmDelBig();">ɾ��</a>
          </td>
        </tr>
			<%
				'response.write "cateid========"&cateid
				set rschild=server.CreateObject("ADODB.RecordSet")
				rschild.open "select * from product_cate where parent_id="&cateid&" order by listorder asc",conn,1
				while not rschild.eof
			%>
        <tr bgcolor="#eeeeee" class="tdbg"> 
          <td width="160" height="22">
          	&nbsp;&nbsp;<img src="images/tree_folder3.gif" width="15" height="15">
          	<A HREF="Product_Cate_Edit.asp?cateid=<%=rschild("pro_cate_id")%>"><%=rschild("pro_cate_name")%></a>
          </td>
          <td align="right">
            	<a href="Product_Cate_Edit.asp?cateid=<%=rschild("pro_cate_id")%>">�޸�</a> 
            | <a href="Product_Cate_Edit.asp?mode=Del&rootid=<%=rschild("Parent_ID")%>&cateid=<%=rschild("pro_cate_id")%>" onClick="return ConfirmDelBig();">ɾ��</a>
          </td>
        </tr>
      <%
					rschild.MoveNext
				wend 
				rschild.close
				set rschild=nothing
			%>
<%
		rs.movenext
  wend
  rs.close
  set rs=nothing
%>        
        
    </table>

</BODY>
</HTML>
<%
sub GetChiled(cateid,level,rootid)
	set rschiled=server.CreateObject("ADODB.RecordSet")
	rschiled.open "select * from product_cate where parent_id="&cateid&" order by listorder asc ",conn,1
	while not rschiled.eof
		str1="<A HREF=""Product_Cate_Edit.asp?cateid=" & rschiled("PRO_CATE_ID") & """>" & rschiled("PRO_CATE_NAME") & "(��ţ�"& rschiled("listorder") &")</A>---------"
		str1=str1 & "  <A HREF=""Product_Cate_New.asp?cateid=" & rschiled("PRO_CATE_ID") & "&catename="& rschiled("PRO_CATE_ID") & "&rootid="& rootid & """><font color=red>+</font></A>"
		str1=str1 & "<br>"
		call list(str1,level)
		call Getchiled(rschiled("PRO_CATE_ID"),(level+1),rootid)
	rschiled.movenext
	wend
	rschiled.close
	set rschiled=nothing
end sub

sub list(str,level)
	space=""
	for i=1 to level
		space=space+"����������"
	next
	str=space & str
	Response.Write str
end sub
%>
<%CloseDatabase%>