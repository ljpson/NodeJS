<%
'ip_address = Request.ServerVariables("SERVER_NAME")
'domain_name = Request.ServerVariables("HTTP_HOST")
'browser = Request.ServerVariables("HTTP_USER_AGENT")
'Response.write ip_address+" and "+domain_name+" and "+browser

name=Request("name")
page=Request("page")
sp=Request("startpage")
num=Request("num")

writer=Replace(Request("writer"),"'","''")
email=Replace(Trim(Request("email")),"'","''")
homepage=Replace(Trim(Request("homepage")),"'","''")
subject=Replace(Request("subject"),"'","''")
content=Replace(Request("content"),"'","''")
password=Replace(Trim(Request("password")),"'","''")

set DbCon=Server.CreateObject ("adodb.Connection")
DbCon.Open "7npoint","sa","Ekdelsl"  

SQLStmt = "SELECT password FROM "&name&" WHERE num="&num
Set Result = DbCon.Execute(SQLStmt)

If Trim(Result("password")) = password Then

	SQLString = "UPDATE "&name&" SET "
	SQLString = SQLString & " writer='"& writer &"',"
	SQLString = SQLString & " email='"& email &"',"
	SQLString = SQLString & " homepage='"& homepage &"',"
	SQLString = SQLString & " subject='"& subject &"',"
	SQLString = SQLString & " regdate= getdate(),"
	SQLString = SQLString & " content='"& content &"'"
	SQLString = SQLString & " WHERE num="&num

	DbCon.Execute(SQLString)
  
Result.Close
Set Result = Nothing
DbCon.Close
Set DbCon = Nothing

	Session("msg_blank") = "���� ����!!"
	'Response.Redirect "up_blank.asp?name="&name&"&num="&num&"&page="&page&"&startpage="&sp
	Response.Redirect "board.asp?name="&name&"&num="&num&"&page="&page&"&startpage="&sp

Else
	Session("updatemsg") = "���� ����, ��й�ȣ�� Ȯ���Ͻʽÿ�."
	Response.Redirect "preupdate.asp?name="&name&"&num="&num&"&page="&page&"&startpage="&sp
End If
%>
