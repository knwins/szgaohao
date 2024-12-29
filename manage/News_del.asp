<!--#include file="conn.asp"-->
<!--#include file="denlu.asp"-->


<%
  dim sql  
  sql = "delete * from news where PRODUCT_ID = "&Request.QueryString("id")
  conn.Execute (sql)
  Response.Redirect "News_List.asp"
%>

<%CloseDatabase%>
