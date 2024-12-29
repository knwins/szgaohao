<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="fconn.asp"-->
<%set rs=server.createobject("adodb.recordset")
sql="select * from site where id=2"
rs.open sql,conn,1,1
title=rs("title")
description=rs("description")
key=rs("key")
rs.close
set rs=nothing%>
<head>
<title><%=title%></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta name="description" content="<%=description%>">
<meta name="keywords" content="<%=key%>">
</head>
<body>
<!--#include file="top.htm"-->
<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
  <TBODY>
  <TR>
    <TD valign="top"><table width="188" border=0 cellpadding=0 cellspacing=0>
        <tbody>
          <tr>
            <td colspan="2" align=center class="font12"><img src="images/imges_05.jpg" width="184" height="1" /></td>
          </tr>
          <tr>
            <td colspan="2" align=center class="font12">News Center </td>
            </tr>
          <tr>
            <td height=12 colspan="2" align="center"><img height="6"  src="images/dianxian.jpg" width="164" /></td>
            </tr>
          <%
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from news_cate where ver='en' order by listorder desc"
		rs.open sql,conn,1,1
		while not rs.eof
%>
          <tr>
            <td align=right style="padding-right:10px;"><img src="images/dian.jpg" width="12" height="12" /></td>
              <td align=left><a href="news.asp?type=<%=rs("id")%>" target="_self" class="font12"><%=rs("typename")%></a></td>
            </tr>
          <tr>
            <td colspan="2" align=center><img height=6  src="images/dianxian.jpg" width=164></td>
            </tr>
          <% 
		  rs.MoveNext
		wend 
		rs.close
		set rs=nothing%>
        </tbody>
      </table>
      </TD>
    <TD width="14" rowspan="2" align=right>&nbsp; </TD>
    <TD width="221" rowspan="2" align=right valign="top"><TABLE width="100%" border=0 align="left" cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD><IMG height=4 src="images/imges_09.jpg" 
            width=582></TD>
        </TR>
        <TR>
          <TD vAlign=top 
          background="images/imges_11.jpg">
            <TABLE border=0 align="center" cellPadding=0 cellSpacing=0>
              <TBODY>
                <TR>
                  <TD align=middle colSpan=2><div align="center">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="575" height="160">
                      <param name="movie" value="swf/banner.swf" />
                      <param name="quality" value="high" />
                      <embed src="swf/banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="575" height="160"></embed>
                    </object>
                  </div></TD>
                </TR>
                <TR>
                  <TD vAlign=top align=middle colSpan=2><table width=97% border=0 align="center" cellpadding=0 cellspacing=0>
          <tbody>
            <tr>
              <td width=597 height=16>&nbsp;</td>
            </tr>
            <tr>
              <td><table cellspacing=2 cellpadding=0 width=100% border=0>
                  <tbody>
                    <tr>
                      <td valign=center align=middle width=25><img height=12 src="images/yuandian.jpg" width=12></td>
                      <td valign=bottom align=left width=566><span class="font">Location</span>:<a class=p12a href="index.asp">Home</a> &gt;&gt; News center </td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
            <tr>
              <td><img src="images/daohang.jpg"></td>
            </tr>
            <tr>
              <td align="left" ><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <% 	if request("type")<>""then
		session("type")=request("type")
		end if
	page=clng(request("page"))		 
	set rs=server.createobject("adodb.recordset") 
	if request("type")<>"" then
	sql="select * from news where type="&session("type")&" and ver='en'"
	rs.open sql,conn,1,1
	else
	sql="select * from news where ver='en' order by orders desc"
	rs.open sql,conn,1,1
	end if
    if rs.eof and rs.bof then
     response.write("No Record")
     else 
	rs.pagesize=12
	if page=0 then page=1 
	pages=rs.pagecount
	if page > pages then page=pages
	rs.absolutepage=page  
	for j=1 to rs.pagesize 
%>
          <tr>
            <td width="6%" height="24" align="center" ><img src="images/click_ticon.gif" width="7" height="9" /></td>
            <td height="24" style="border-bottom: #999999 1px dotted"><a class="news" href="newsinfo.asp?id=<%= rs("product_id")%>"><%= rs("product_name") %></a>　<font color="#999999">[<%= rs("createdate") %>] </font></td>
          </tr>
          <%
rs.movenext
if rs.eof then exit for
next
%>
          <tr valign="bottom">
            <td height="50" colspan="2" align="center" ><form method=post action="news.asp?type="<%=session("type")%>"">
                <%if page<2 then      
    response.write "First Previous &nbsp;"
  else
    response.write "<a href=news.asp?type="&session("type")&"&page=1>Home</a>&nbsp;"
    response.write "<a href=news.asp?type="&session("type")&"&page=" & page-1 & ">Previous</a>&nbsp;"
  end if
  if rs.pagecount-page<1 then
    response.write "next last"
  else
    response.write "<a href=news.asp?type="&session("type")&"&page=" & (page+1) & ">"
    response.write "next</a> <a href=news.asp?type="&session("type")&"&page="&rs.pagecount&">last</a>"
  end if
   response.write "&nbsp;current:<strong><font color=red>"&page&"</font>/"&rs.pagecount&"</strong>page "
    response.write "&nbsp;Total:<b><font color='#ff0000'>"&rs.recordcount&"</font></b> record &nbsp;<b>"&rs.pagesize&"</b>/page"
   response.write " Turn to <input type='text' name='page' size=2 maxlength=4 value="&page&">"
   response.write " <input type='submit' value='Go' name='cndok'></span></p>"     
%>
              </form></td>
          </tr>
          <% 
end if
rs.close
set rs=nothing
%>
      </table></td>
            </tr>
          </tbody>
        </table></TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
        <TR>
          <TD><IMG height=3 src="images/imges_10.jpg" 
            width=582></TD>
        </TR>
      </TBODY>
    </TABLE></TD>
  </TR>
  <TR>
    <TD width=555 valign="top"><!-- #BeginLibraryItem "Library/left_en.lbi" --><table cellspacing="0" cellpadding="3" width="100%" border="0">
        <tbody>
          <tr>
            <td class="font-ying" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td><img height="1" src="images/imges_05.jpg" width="184" /></td>
          </tr>
          <tr>
            <td align="center">
            <p class="font12">Customers' Service</p></td>
          </tr>
          <tr>
            <td align="right" class="font11"> <span style="font-weight: bold">Add:</span>Building B1, Mabu No.2 Industrial Area, Xixiang Town, Bao'an District, Shenzhen, Guangdong Province, China<br />
<span style="font-weight: bold">Tel:</span>86-755-27965528
              <br />
                  <span style="font-weight: bold">Fax:</span>86-755-27963767 
                  <br />
                  <span style="font-weight: bold">E-mail:</span><a href="mailto:sales@szgaohao.com">Sales@szgaohao.com</a><br />
                  <span style="font-weight: bold">Web:</span><a href="http://www.szgaohao.com">www.szgaohao.com</a></td>
          </tr>
        </tbody>
      </table><!-- #EndLibraryItem --></TD></TR>
  </TBODY></TABLE>
<!--#include file="bottom.htm" -->