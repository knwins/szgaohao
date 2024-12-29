<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="fconn.asp"-->
<%
id=request("id")
set rs=server.createobject("adodb.recordset")
sql="select * from news where product_id="&id&""
rs.open sql,conn,1,1
product_name=rs("product_name")
content=rs("content")
createdate=rs("createdate")
rs.close
set rs=nothing%>
<head>
<title><%=product_name%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta name="description" content="<%=product_name%>">
<meta name="keywords" content="<%=product_name%>">
</head>
<body>
<!--#include file="top.htm"-->
<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
  <TBODY>
    <TR>
      <TD width=555 valign="top"><table width="188" border="0" cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <td colspan="2" align="center" class="font12"><img src="images/imges_05.jpg" width="184" height="1" /></td>
          </tr>
          <tr>
            <td colspan="2" align="center" class="font12">News Center </td>
          </tr>
          <tr>
            <td height="12" colspan="2" align="center"><img height="6"  src="images/dianxian.jpg" width="164" /></td>
          </tr>
          <%
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from news_cate where ver='cn' order by listorder desc"
		rs.open sql,conn,1,1
		while not rs.eof
%>
          <tr>
            <td align="right" style="padding-right:10px;"><img src="images/dian.jpg" width="12" height="12" /></td>
            <td align="left"><a href="news.asp?type=<%=rs("id")%>" target="_self" class="font12"><%=rs("typename")%></a></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><img height="6"  src="images/dianxian.jpg" width="164" /></td>
          </tr>
          <% 
		  rs.MoveNext
		wend 
		rs.close
		set rs=nothing%>
        </tbody>
      </table>
        <table cellspacing="0" cellpadding="3" width="100%" border="0">
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
      <TD align=right width=14>&nbsp;</TD>
      <TD width=221 align=right valign="top"><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
          <TBODY>
            <TR>
              <TD><IMG height=4 src="images/imges_09.jpg" 
            width=582></TD>
            </TR>
            <TR>
              <TD vAlign=top 
          background="images/imges_11.jpg"><TABLE border=0 align="center" cellPadding=0 cellSpacing=0>
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
                      <TD vAlign=top align=middle colSpan=2><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tbody>
                          <tr>
                            <td width="597" height="16">&nbsp;</td>
                          </tr>
                          <tr>
                            <td><table cellspacing="2" cellpadding="0" width="100%" border="0">
                                <tbody>
                                  <tr>
                                    <td valign="center" align="middle" width="25"><img height="12" src="images/yuandian.jpg" width="12" /></td>
                                    <td valign="bottom" align="left" width="566"><span class="font">当前位置</span>:<a class="p12a" href="product.asp">首页</a> &gt;&gt;新闻中心 </td>
                                  </tr>
                                </tbody>
                            </table></td>
                          </tr>
                          <tr>
                            <td><img src="images/daohang.jpg" /></td>
                          </tr>
                          <tr>
                            <td align="left" ><table width="99%" border="0" cellspacing="4" cellpadding="5">
                              <tr>
                                <td align="center" class="p14" style="padding-top:8px;"><%=product_name%></td>
                              </tr>
                              <tr>
                                <td align="center" class="font11"><strong>发布时间:</strong><%=year(createdate)%>/<%=month(createdate)%>/<%=day(createdate)%>&nbsp;&nbsp;&nbsp;<strong>发布人:</strong>高浩实业</td>
                              </tr>
                              <tr>
                                <td align="left" class="content"><%=content%></td>
                              </tr>
                              <tr>
                                <td align="center"></td>
                              </tr>
                            </table></td>
                          </tr>
                        </tbody>
                      </table>
                      </TD>
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
  </TBODY>
</TABLE>
<!--#include file="bottom.htm" -->
