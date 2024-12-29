<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="fconn.asp"-->
<%
session("ver")="cn"
cname="企业文化"
set rs=server.CreateObject("adodb.recordset")
sql="select * from company where cname='"&cname&"'"
rs.open sql,conn,1,1
content=rs("content")
title=rs("title")
description=rs("description")
key=rs("key")
rs.close
set rs=nothing%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" type=text/css rel=stylesheet>
<meta name="Description" content="<%=description%>" />
<meta name="Keywords" content="<%=key%>" />
<title><%=title%></title>
</head>
<body>
<!--#include file="top.htm"-->
<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
  <TBODY>
  <TR>
    <TD width=555  valign="top"><TABLE width="98%" height="350" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD vAlign=top align=middle width=181 
          background="images/imges_08.jpg" 
          height=281>
            <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
              <TBODY>
                <TR>
                  <TD width="39%" height=32>&nbsp;</TD>
                  <TD class=font-ying-da2 vAlign=bottom align=middle 
                  width="54%"> </TD>
                  <TD width="7%">&nbsp;</TD>
                </TR>
                <TR>
                  <TD colSpan=2 height=16>&nbsp;</TD>
                  <TD>&nbsp;</TD>
                </TR>
              </TBODY>
          </TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0  valign="top">
              <TBODY>
                <TR> </TR>
                <TR>
                  <TD width="100%">
                    <table width="74%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="15"></td>
                  </tr>
                  <%
	set rs=server.createobject("adodb.recordset")
	rs.open "select * from product_cate where parent_id=0 and ver='"&session("ver")&"' order by listorder asc",conn,1
	while not rs.eof
		getcateid = rs("pro_cate_id")
		getcatename = rs("pro_cate_name")
%>
                  <tr>
                    <td ><img height=6 src="images/dianxian.jpg"></td>
                  </tr>
                  <tr>
                    <td height="18" class="big" align="left"><img src="images/big.gif" width="15" height="15" > <%=rs("pro_cate_name")%></td>
                  </tr>
                  <tr>
                    <td ><img height=6 src="images/dianxian.jpg"></td>
                  </tr>
                  <%
								set rsbig=server.createobject("adodb.recordset")
								sql = "select * from product_cate where ver='"&session("ver")&"' and root_id = "& getcateid &" and parent_id = "& getcateid &" order by listorder asc"
								rsbig.open sql,conn,1
								if  not rsbig.eof  then
									while not rsbig.eof 
%>
                  <tr>
                    <td class="small" align="left"><img src="images/small.gif" width="15" height="15"> <a href="product.asp?cateid=<%=rsbig("pro_cate_id")%>&catename=<%=rsbig("pro_cate_name")%>"><%=rsbig("pro_cate_name")%></a> </td>
                  </tr>
                  <tr>
                    <td height="5"></td>
                  </tr>
                  <% dim gname
														set rslit=server.createobject("adodb.recordset")
														sql = "select * from product_cate where root_id = "& getcateid &" and parent_id = "& rsbig("pro_cate_id") &" order by listorder asc"
														rslit.open sql,conn,1
														
														if  not rslit.eof  then
															while not rslit.eof 
															session("catename")=rslit("pro_cate_name")
															
															
%>
                  <tr>
                    <td class="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="product.asp?cateid=<%=rslit("pro_cate_id")%>&catename=<%=rslit("pro_cate_name")%>"><%=rslit("pro_cate_name")%></a> </td>
                  </tr>
                  <tr>
                    <td height="5"></td>
                  </tr>
                  <%                          
																rslit.movenext
															wend 
														end if
														rslit.close
														set rslit=nothing
%>
                  <%                          
										rsbig.movenext
									wend 
								end if
								rsbig.close
								set rsbig=nothing
%>
                  <%
		rs.movenext
	wend 
	rs.close
	set rs=nothing
%>
                </table></TD>
                </TR>
              </TBODY>
            </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE><table cellspacing="0" cellpadding="3" width="100%" border="0">
        <tbody>
          <tr>
            <td class="font-ying" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td><img height="1" src="../images/imges_05.jpg" width="184" /></td>
          </tr>
          <tr>
            <td align="center">
            <p class="font12">客户服务中心</p></td>
          </tr>
          <tr>
            <td align="right" class="font11"> <span style="font-weight: bold">地址：</span>广东省惠州市博罗县湖镇镇钓湖工业区<br />
<span style="font-weight: bold">电话:</span>86-752-6305886
              <br />
                  <span style="font-weight: bold">邮箱:</span><a href="mailto:Sales@szgaohao.com">Sales@szgaohao.com</a><br />
            <span style="font-weight: bold">网址:</span><a href="http://www.szgaohao.com">www.szgaohao.com</a></td>
          </tr>
        </tbody>
      </table></TD>
    <TD align=right width=14>&nbsp; </TD>
    <TD width=221 align=right valign="top">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      <TBODY>
        <TR>
          <TD><IMG height=4 src="images/imges_09.jpg" 
            width=582></TD>
        </TR>
        <TR>
          <TD vAlign=top 
          background="images/imges_11.jpg">
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
                <TR>
                  <TD align=middle colSpan=2><div align="center">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="575" height="160">
                      <param name="movie" value="../swf/banner.swf" />
                      <param name="quality" value="high" />
                      <embed src="../swf/banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="575" height="160"></embed>
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
                      <td valign=bottom align=left width=566> <%=cname %></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
            <tr>
              <td><img src="images/daohang.jpg"></td>
            </tr>
            <tr>
              <td align="left" class="content"><%=content%></td>
            </tr>
          </tbody>
        </table></TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
        <TR>
          <TD><IMG height=3 src="images/imges_10.jpg" width=582></TD>
        </TR>
      </TBODY>
    </TABLE></TD></TR>
  </TBODY></TABLE>
<!--#include file="bottom.htm" -->