<!--#include file="upload.inc"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>
td{font-size:9pt;line-height:120%;color:#353535} 
body{font-size:9pt;line-height:120%} 

a:link          { color: #000000; text-decoration: none }
a:visited       { color: #000000; text-decoration: none }
a:active        { color: #000000; text-decoration: none }
a:hover         { color: #336699; text-decoration: none; position: relative; right: 0px; top: 1px }
</style>
<%
set upload=new upload_file
if upload.form("act")="uploadfile" then
	filepath=trim(upload.form("filepath"))
	filelx=trim(upload.form("filelx"))
	
	i=0
	for each formName in upload.File
		set file=upload.File(formName)
 
 fileExt=lcase(file.FileExt)	'�õ����ļ���չ��������.
 if file.filesize<100 then
 	response.write "<span style=""font-family: ����; font-size: 9pt"">����ѡ����Ҫ�ϴ����ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if (filelx<>"swf") and (filelx<>"jpg") and (filelx<>"rar") then 
 	response.write "<span style=""font-family:����; font-size: 9pt"">���ļ����Ͳ����ϴ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if filelx="swf" then
	if fileext<>"swf"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�swf��ʽ��Flash�ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 if filelx="jpg" then
	if fileext<>"gif" and fileext<>"jpg" and fileext<>"bmp" and fileext<>"pdf" and fileext<>"tif" then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�jpg��gif��bmp��tif��pdf��ʽ��ͼƬ��[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
     	end if
 end if
 if filelx="rar" then
	if fileext<>"rar" and fileext<>"doc" and fileext<>"exe" and fileext<>"zip" and fileext<>"pdf" and fileext<>"midi" and fileext<>"mp3" and fileext<>"wav" then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�rar��doc��exe��zip��ʽ���ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
     	end if
 end if
 if filelx="swf" then
	if file.filesize>(3000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 3M ��Flash�ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 if filelx="jpg" then
	if file.filesize>(1000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 1000K ��ͼƬ�ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
	end if
	if filelx="rar" then
	if file.filesize>(10000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 10M ���ļ���[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
	end if 

 randomize
 ranNum=int(90000*rnd)+10000
 filename=filepath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
%>
<%
 if file.FileSize>0 then         ''���  FileSize > 0 ˵�����ļ�����
  'file.SaveAs Server.mappath(filename)   ''�����ļ�
  file.SaveToFile Server.mappath(FileName)
  'response.write file.FileName&"�ϴ��ɹ�!<br>"
  'response.write "���ļ�����"&FileName&"<br>"
  'response.write "���ļ����Ѹ��Ƶ������λ�ã��ɹرմ��ڣ�"
  if filelx="swf" or filelx="rar" or filelx="doc" or filelx="exe" then
      response.write "<script>window.opener.document."&upload.form("FormName")&".size.value='"&int(file.FileSize/1024)&" K'</script>"
  end if
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&FileName&"'</script>"
%>
<%
 end if
 set file=nothing
	next
	set upload=nothing
end if
%>
<script language="javascript">
window.alert("�ļ��ϴ��ɹ�!");
window.close();
</script>
