<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
	<% 
	dim product_id, PRODUCT_NAME, CONTENT, INTRO, ORDERS, S_IMAGE, B_IMAGE, sql, CONTENT1
	product_id    = Request.Form("product_id")
	PRODUCT_NAME  = Request.Form("PRODUCT_NAME")
	CONTENT       = Request.Form("content")
	INTRO         = Request.Form("INTRO")
	ORDERS        = Request.Form("ORDERS")
	COMMEND       = Request.Form("COMMEND")
	S_IMAGE       = Request.Form("S_IMAGE")
	B_IMAGE       = Request.Form("B_IMAGE")
	TYPES         = Request.Form("TYPES")
	
	if INTRO = "" then
	INTRO = 0
	end if
	
	if COMMEND = "" then
	COMMEND = 0
	else
	COMMEND = 1
	end if
	%>

<%
	sql = "update product set PRODUCT_NAME = '"&PRODUCT_NAME&"',CONTENT = '"&CONTENT&"', INTRO = '"&INTRO&"', "
	sql = sql & "COMMEND = "&COMMEND&", ORDERS = '"&ORDERS&"', S_IMAGE = '"&S_IMAGE&"', B_IMAGE = '"&B_IMAGE&"', "
	sql = sql & "TYPE = '"&TYPES&"' "
	sql = sql & "where product_id = "&product_id
	Response.Write sql
	conn.Execute (sql)
	
	Response.Write "更新成功！"
	response.write "<script>window.opener.location.reload();</script>"
	Response.Redirect "Product_List.asp"
%>
<%CloseDatabase%>