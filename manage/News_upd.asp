<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
<% 
	dim product_id,product_name,content,intro,orders,sql,content1
	product_id    = request.form("product_id")
	product_name  = request.form("product_name")
	content       = request.form("content")
	orders        = request.form("orders")
	if request.form("s_image")<>"" then
	s_image        = request.form("s_image")
	else
	s_image=""
	end if
	types         = request.form("types")
%>

<%
set rs=server.createobject("adodb.recordset") 
sql="select * from news where product_id="&product_id
rs.open sql,conn,1,3 
rs("PRODUCT_NAME")=PRODUCT_NAME
rs("createdate")=now()
rs("CONTENT")=CONTENT
rs("ORDERS")=ORDERS
rs("TYPE")=TYPES
rs.update
rs.close
set rs=nothing
	response.write sql
	conn.execute (sql)
	response.write "���³ɹ���"
	response.write "<script>window.opener.location.reload();</script>"
	response.redirect "news_list.asp?currentpage="&session("page")&""
%>

