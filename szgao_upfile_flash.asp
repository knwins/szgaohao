<!--#include file="upload_wj.inc"-->

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
 	response.write "<span style=""font-family: ����; font-size: 9pt"">����ѡ����Ҫ�ϴ����ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if (filelx<>"jpg") then 
 	response.write "<span style=""font-family: ����; font-size: 9pt"">���ļ����Ͳ����ϴ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if filelx="jpg" then
	if fileext<>"gif" and fileext<>"jpg" and fileext<>"bmp"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�jpg��gif��bmp��ʽ��ͼƬ����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
     	end if
 end if
 if filelx="jpg" then
	if file.filesize>(100*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 200K ��ͼƬ�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if

 randomize
 ranNum=int(100*rnd)+100
 filename=filepath&"pro_"&year(now)&month(now)&second(now)&ranNum&"."&fileExt
%>
<%
 if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
  'file.SaveAs Server.mappath(filename)   ''�����ļ�
  file.SaveToFile Server.mappath(FileName)
  
  'response.Write("<script language='javascript'>")
  'response.write("window.alert('�ļ��ϴ��ɹ�!�벻Ҫ�޸����ɵ����ӵ�ַ��');")
  'response.Write("window.close();")
  'response.Write("/script>")
  response.write "          "&file.FileName&"�����ϴ��ɹ�!����<br>"
  response.write "          ���ļ�����"&FileName&"<br>"
  response.write "          ���ļ����Ѹ��Ƶ������λ�ã���<a href='javascript:window.close();'><font color=red>�رմ���</font></a>��"
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&FileName&"'</script>"
%>
<%
 end if
 set file=nothing
	next
	set upload=nothing
end if
%>

