<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="fconn.asp"-->
<%
session("ver")="cn"
if request("cateid")<>"" then
session("cateid") = request("cateid")
end if
catename  = replace(Request("catename"),"'","")
if replace(Request("catename"),"'","")<>"" then
session("catename")=replace(Request("catename"),"'","")
end if
set rs=server.createobject("adodb.recordset")
sql="select * from site where id=1"
rs.open sql,conn,1,1
title=rs("title")
description=rs("description")
key=rs("key")
rs.close
set rs=nothing%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta name="Description" content="<%=description%>" />
<meta name="Keywords" content="<%=key%>" />
<title><%=title%> - <%=session("catename")%></title>
</head>
<body>
<!--#include file="top.htm"-->
<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
  <TBODY>
  <TR>
    <TD width=555 valign="top">	<TABLE width="98%" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD vAlign=top align=middle width=181 background="images/imges_08.jpg">
            <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
              <TBODY>
                <TR>
                  <TD width="39%" height=32>&nbsp;</TD>
                  <TD class=font-ying-da2 vAlign=bottom align=middle width="54%"> <div align="center" class="font14">产品展示<br />
                  </div></TD>
                  <TD width="7%">&nbsp;</TD>
                </TR>
                <TR>
                  <TD colSpan=3 height=16><table width="75%" border="0" align="center" cellpadding="0" cellspacing="0">
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
                    <td class="left"  style="padding-bottom:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="product.asp?cateid=<%=rslit("pro_cate_id")%>&catename=<%=rslit("pro_cate_name")%>"><%=rslit("pro_cate_name")%></a> </td>
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
                </table>
                    <br /></TD>
                  </TR>
              </TBODY>
          </TABLE>
           </TD>
        </TR>
      </TBODY>
    </TABLE>
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
                                    <td valign="bottom" align="left" width="566"><span class="font">当前位置</span>:<a class="p12a" href="product.asp">产品展示</a> &gt;&gt; <%=session("catename")%></td>
                                  </tr>
                                </tbody>
                            </table></td>
                          </tr>
                          <tr>
                            <td><img src="images/daohang.jpg" /></td>
                          </tr>
                          <tr>
                            <td align="left" ><table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
                  <tr>
                    <td align="center"><table cellspacing=2 cellpadding=3 width=99% border=0>
                        <%
set rs=server.CreateObject("ADODB.RecordSet")
if session("cateid")<>"" then
sql = "select * from product where type = "& session("cateid") &" and ver='"&session("ver")&"' order by orders asc"
else 
sql = "select * from product where ver='"&session("ver")&"' order by orders asc"
end if
rs.open sql,conn,1

if rs.eof and rs.bof then
response.write("<br>NO Record<br>")
else
dim page
 IF not IsNumeric(Request("page")) Or IsEmpty(Request("page")) Then
	page=1
	Else
	Page=Int(Abs(Request("page")))
 End if
rs.pagesize =20
total  = rs.RecordCount
mypagesize=rs.pagesize
rs.absolutepage = page	
%>
                        <tr>
                          <%
		Dim hang, idx
		hang = 3
		idx = 0
		while not rs.eof and mypagesize>0
			if rs("INTRO")="" then
			jiage = 0
			else
			jiage = rs("INTRO")
			end if

		%>
                          <td align="center" style="padding-top:15px;" valign="top">
						  <table border="0" cellspacing="2" cellpadding="5">
                              <tr>
                                <td><a href="productshow.asp?productid=<%=rs("product_id")%>" > <img src="/<%=rs("S_IMAGE")%>" width=150 border=0></a> </td>
                              </tr>
                              <tr>
                                <td align="center" bgcolor="#FFFFFF" class="font"><a href="productshow.asp?productid=<%=rs("product_id")%>" ><%=rs("product_name")%></a></td>
                              </tr>
                            </table></td>
                          <%  
	mypagesize=mypagesize-1                        
	idx = idx + 1
		if idx mod hang = 0 then
		response.write "</tr><tr>"
		end if
	rs.MoveNext
	wend 
	%>
                        </tr>
                       
                      </table></td>
                  </tr>
                  <tr>
                    <td height="32" align="center"><table border="0" cellspacing="0" cellpadding="0" class="font">
                        <form name="form2" method="post" action="product.asp">
                          <tr>
                            <td align="center" height="22">共计:<b><%=total%></b>&nbsp;&nbsp;<%=page%>/<b><%=rs.pagecount%></b> 页 <a href="product.asp?page=1">首页</a>
                              <%if page>1 then%>
                              <a href=product.asp?page=<%=page-1%>>上一页</a>
                              <%else%>
                              上一页
                              <%end if%>
                              <%if page<rs.pagecount   then%>
                              <a href=product.asp?page=<%=page+1%>>下一页</a>
                              <%else%>
                              下一页
                              <%end if%>
                              <a href=product.asp?page=<%=rs.pagecount%>>最后页</a>
                              <select name="page">
                                <%for i=1 to rs.pagecount%>
                                <option value=<%=i%>
			<%if i=page then
			response.write" selected"
			end if%>><%=i%></option>
                                <%next%>
                              </select>
                              <input type="submit" name="Submit2" value="Go" class="sbutton">
                            </td>
                          </tr>
                        </form><%
end if
rs.close
set rs=nothing%>
                      </table>
                    </td>
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
          <TD><IMG height=3 src="images/imges_10.jpg" width=582></TD>
        </TR>
      </TBODY>
    </TABLE></TD></TR>
  </TBODY></TABLE>
<!--#include file="bottom.htm" -->