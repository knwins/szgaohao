<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<%  if session("ver")="" or  request("ver")="cn" or request("ver")="en" then
      session("ver")=request("ver")
	end if
	bymode=trim(request("bymode"))
	search=trim(request("search"))
	search2=trim(request("search2"))

	dim rs,rec,mc,ms,xh
	set rs=server.createobject("adodb.recordset")
	
  if trim(bymode)="byname" then
		rs.open "select * from news where ver='"&session("ver")&"' and  product_name like '%" + search + "%' order by createdate desc",conn,1
	elseif trim(bymode)="bytype" then
  		rs.open "select * from news where ver='"&session("ver")&"' and  type = " + search2 + " order by createdate desc",conn,1
	else
		rs.open "select * from news where ver='"&session("ver")&"' order by createdate desc",conn,1
	end if
	
	'-------------------------------------------
	pagesize=5
	icount=rs.recordcount 
	
	if (icount mod pagesize)=0 then
		pagecount=int(icount/pagesize)
	else
		pagecount=int(icount/pagesize)+1
	end if
	if request("currentpage")<>"" and request("currentpage")<>"0" then
		currentpage=cint(request("currentpage"))
	else
		currentpage=1
	end if
	if not rs.eof then
		rs.pagesize =pagesize
		rs.absolutepage=currentpage
		ipage=0
	end if
	if  icount=0 then
		currentpage=0
	end if
	'-------------------------------------------

%>
<html>
<head>
<title>后台数据管理中心</title>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link rel=stylesheet type="text/css" href="js/media.css">
<link rel=stylesheet type="text/css" href="js/form_media.css">
<script language=javascript>
<!--
	function submitform(mode){
		form1.action="News_list.asp?bymode="+mode;
		form1.submit();
	}
  function del(did){
	    temp=window.confirm("确定要删除吗？")
	    if( temp ){
	      location.href = "News_del.asp?id="+did;
	    }
	}
//-->

</script>
</head>
<body bgcolor="#ffffff" leftmargin=0 topmargin=0>
<table width="95%" cellspacing="0"  border=0 cellpadding="2" >
<tr>
	<td align=center>
		<table width="95%" border="1" cellspacing="0" cellpadding="2" bordercolor="#cccccc">
		  <tr bgcolor="#e4e4e4"> 
		    <td align="center"> 
		      <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <form name="form1" method="post">
		        <tr> 
		          <td width="20%">
		          	请输入新闻标题模糊查询：
		            <input name=search size=51 value="<%=search%>">
		            &nbsp;<a href="javascript:submitform('byname')">查询</a>
		          </td>
		        </tr>
		        <tr>
		          <td width="20%">
		          请输入类别查询：&nbsp;&nbsp;&nbsp;&nbsp;
                	<select  name="search2"><%call showtype()%></select>
		            &nbsp;<a href="javascript:submitform('bytype')">查询</a>
		          </td>
		        </tr>
		      </form>
		      </table>
		    </td>
		  </tr>
		</table>
	</td>
</tr>

<tr>
	<td>
		<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
		  <tr> 
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		  	<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td>共 <%=icount%> 条 第<%=currentpage%>页（共<%=pagecount%>页） | 
					      <%if currentpage>1 then
					      		response.write "<a href=news_list.asp?search=" & search & "&search2=" & search2 & "&bymode=" & bymode & "&currentpage=1>首页</a>&nbsp;&nbsp;"
										response.write "<a href=news_list.asp?search=" & search & "&search2=" & search2 & "&bymode=" & bymode & "&currentpage=" & (currentpage-1) & ">上一页</a>&nbsp;&nbsp;"
									  else
									  response.write "首页&nbsp;&nbsp;"
										response.write "上一页&nbsp;&nbsp;"
									end if	
								%>
					      <%if currentpage<pagecount then
										response.write "<a href=news_list.asp?search=" & search & "&search2=" & search2 & "&bymode=" & bymode & "&currentpage=" & (currentpage+1) & "> 下一页</a>"
										response.write "<a href=news_list.asp?search=" & search & "&search2=" & search2 & "&bymode=" & bymode & "&currentpage=" & pagecount & "> 末页</a>"
									  else
										response.write " 下一页&nbsp;&nbsp;"
										response.write " 末页"
									end if
								%>
								| <a href='news_new.asp'>新增</a>
					    </td>
					  </tr>
					</table>
		      <table width="100%" cellpadding="1" bgcolor="#ffffff" cellspacing="1" bordercolor="#cccccc">
					  <tr bgcolor="#e4e4e4"> 
					    <td  height="23"align=center bgcolor="006699"><b ><font color="#FFFFFF">序号</font></b></td>
					    <td align=center bgcolor="006699"><b><font color="#FFFFFF">新闻标题</font></b></td>
					    <td align=center bgcolor="006699"><b><font color="#FFFFFF">发布日期</font></b></td>
					    <td align=center bgcolor="006699"><b><font color="#FFFFFF">类别</font></b></td>
					    <td align=center bgcolor="006699"><b><font color="#FFFFFF">操作</font></b></td>
					  </tr>
<%   
	while not rs.eof and ipage<pagesize
      	cateid = rs("type")
      	set rscate=server.createobject("adodb.recordset")
				rscate.open "select * from news_cate where id= "&cateid &" and ver='"&session("ver")&"' order by listorder asc" ,conn,1
				catename=rscate("typename")
				set rscate=nothing
				'-------------------------------
%>
		        <tr onMouseOver="this.bgColor='#e6e6e6';" onMouseOut="this.bgColor='#F6F6F6';"> 
		          <td height="22"><a href="news_update.asp?id=<%=rs("product_id")%>"><%=rs("orders")%></a></td>
		          <td align="left">
		            <a href="news_update.asp?id=<%=rs("product_id")%>"><%=rs("product_name")%></a>
		          </td>
		          <td><%=rs("createdate")%></td>
		          <td><%=catename%></td>
		          <td><a href="javascript:del(<%=rs("product_id")%>)">删除</a></td>
		        </tr>                          
<%                          
		rs.movenext
		ipage=ipage+1
	wend 
	rs.close
	set rs=nothing
%>
		      </table>
		    </td>
			</tr>       
		</table>
	</td>
</tr>
</table>
</body>       
</html>       

<%
sub getcate(cateid)
	set rscate=server.createobject("adodb.recordset")
	rscate.open "select * from news_cate where id= "&cateid &" and ver='"&session("ver")&"' order by listorder asc" ,conn,1
	catename=rscate("typename")
	set rscate=nothing
end sub
sub showtype()
	set rscate=server.createobject("adodb.recordset")
	rscate.open "select * from news_cate where ver='"&session("ver")&"'order by listorder asc",conn,1
	while not rscate.eof
		str1="<option value="""& rscate("id") & """>" & rscate("typename") & "</option>"
		response.write str1
		rscate.movenext
	wend 
	set rscate=nothing
end sub
sub	getchiled(cateid,level)
		set rschiled=objcate.rsgetproductcate("ado","chiled",cstr(cateid))
		while not rschiled.eof
			objcate.datafromado(rschiled)
			if objcate.productcateid =search2 then
				str1="<option value="""& objcate.productcateid &  """selected>" 
			else
				str1="<option value="""& objcate.productcateid &  """>" 
			end if
			call list(str1,level)
			call getchiled(objcate.productcateid,(level+1))
			rschiled.movenext
		wend
		rschiled.close
		set rschiled=nothing
end sub
sub	list(str,level)
		dim space
		for i=1 to level
			space=space+""
		next
		str2=objcate.typename & "</option>"
		str=str & space & str2
		response.write str
end sub

sub setpublish
	dim strsqltext
	if not intswilldele="" then
		response.write "intswilldele==="&intswilldele
		obj.product_id = intswilldele
		obj.save "ado","publish"
	end if
end sub
%>
<%closedatabase%>
