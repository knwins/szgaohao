<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->
	<% 
	dim PRODUCT_NAME, ORDERS, CONTENT, INTRO, COMMEND, S_IMAGE, B_IMAGE, sql
	PRODUCT_NAME = Request.Form("PRODUCT_NAME")
	ORDERS       = Request.Form("ORDERS")
	INTRO        = Request.Form("INTRO")
	CONTENT      = Request.Form("content")
	COMMEND      = Request.Form("COMMEND")
	S_IMAGE      = Request.Form("s_image")
	B_IMAGE      = Request.Form("B_IMAGE")' ´óÍ¼Æ¬
	TYPES        = Request.Form("TYPES")
	
	if INTRO = "" then
	INTRO = 0
	end if
	if COMMEND = "checkbox" then 
	COMMEND = 1
	else 
	COMMEND = 0
	end if
	sql = "insert into product(PRODUCT_NAME, INTRO, COMMEND, CONTENT, ORDERS, S_IMAGE, B_IMAGE, TYPE,ver)values('"
	sql = sql & PRODUCT_NAME&"' , '"&INTRO&"' , '"&COMMEND&"', '"&CONTENT&"', '"&ORDERS&"', '"&S_IMAGE&"', '"&B_IMAGE&"', '"&TYPES&"','"&session("ver")&"')"
	
	Response.Write sql
	conn.Execute (sql)
	Response.Redirect "Product_List.asp"
	%>

<%CloseDatabase%>