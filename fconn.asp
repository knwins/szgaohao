<%
  ' on Error Resume Next
  '*****************��ֹ�������ʱ�ҳ��*********************
    If InStr(Lcase(Request.ServerVariables("SCRIPT_NAME")),"conn.asp") Then
	   Response.Write "��ֹ�������ʱ�ҳ��"
	   Response.End
    End If
  '*****************��ֹ�������ʱ�ҳ��*********************

  '�����ݿ�
   Dim Conn
   Dim ConnStr
   Dim DBPath
       DBPath  = Server.MapPath("qianwei/qianwei2009.mdb")
   Set Conn    = Server.CreateObject("ADODB.Connection")
       ConnStr = "Provider=Microsoft.Jet.Oledb.4.0; Data Source = "& DBPath &""
	  
	   Conn.Open ConnStr
	 
	   If Err Then
          Err.Clear
          Set Conn = Nothing
          Response.Write "���ݿ����ӳ������������ִ���"
          Response.End
       End If
%>