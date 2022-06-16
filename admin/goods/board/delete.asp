<%
name=Request("name")
page=Request("page")
sp=Request("startpage")
num=cint(Request("num"))

password=Request("password")

set DbCon=Server.CreateObject ("adodb.Connection")
DbCon.Open "7npoint","sa","Ekdelsl"  

SQLStmt = "SELECT password,ref,re_level FROM "&name&" WHERE num="&num
Set Result = DbCon.Execute(SQLStmt)

ref=Result("ref")
re_level=Result("re_level")

SQLStmt1 = "SELECT re_level FROM "&name&" WHERE ref="&ref&" ORDER BY re_level DESC"
Set Result1 = DbCon.Execute(SQLStmt1)

'Response.Write Result1(0)

if Trim(Result("password")) <> password then
	Session("deletemsg") = "비밀번호를 확인하십시요."
	Response.Redirect "predelete.asp?name="&name&"&num="&num&"&page="&page&"&startpage="&sp
else

	if Result("re_level") <> Result1(0) then
		Session("deletemsg") = "답변이 있는 글은 삭제할 수 없습니다. 확인바랍니다."
		Response.Redirect "predelete.asp?name="&name&"&num="&num&"&page="&page&"&startpage="&sp
	else
		SQLString = "DELETE FROM "&name&" WHERE num="&num
		DbCon.Execute(SQLString)

Result1.Close
Set Result1 = Nothing
Result.Close
Set Result = Nothing
DbCon.Close
Set DbCon = Nothing
    
		Session("msg_blank") = num&"번 글이 삭제되었습니다!!"
		'Response.Redirect "up_blank.asp?name="&name&"&num="&num&"&page="&page&"&startpage="&sp
		Response.Redirect "board.asp?name="&name&"&num="&num&"&page="&page&"&startpage="&sp
	end If

end if
%>