<%
'ip_address = Request.ServerVariables("SERVER_NAME")
'domain_name = Request.ServerVariables("HTTP_HOST")
'browser = Request.ServerVariables("HTTP_USER_AGENT")
'Response.write ip_address+" and "+domain_name+" and "+browser

nshop_code=Request("nshop_code")
goods_code=Request("goods_code")
names=Request("names")
page=Request("page")
startpage=Request("startpage")
ref=Request("ref")
step=Request("step")
re_level=Request("re_level")

writer=Replace(Request("writer"),"'","''")
email=Replace(Trim(Request("email")),"'","''")
homepage=Replace(Trim(Request("homepage")),"'","''")
subject=Replace(Request("subject"),"'","''")
content=Replace(Request("content"),"'","''")
password=Replace(Trim(Request("password")),"'","''")

ref=cint(ref)
step=cint(step)
re_level=cint(re_level)

set DbCon=Server.CreateObject ("adodb.Connection")
DbCon.Open "7npoint","sa","Ekdelsl"  

sqlstmt="Select MAX(numm) from "&names
Set DbRec = Server.CreateObject("ADODB.Recordset")
DbRec.open sqlstmt, DbCon

If IsNULL(DbRec(0)) Then
	numm = 1
else 
	numm = DbRec(0) + 1
End If

SQLString = "UPDATE "&names&" SET step=step+1 WHERE ref="&ref&" AND step>"&step
DbCon.Execute(SQLString)

step=step+1
re_level=re_level+1

sql="INSERT INTO "&names&" (nshop_code,goods_code,writer,email,homepage,subject,password,regdate,visited,ref,step,re_level,numm,content)"
sql=sql &"values ('"& nshop_code &"','"& goods_code &"','"& writer &"','"
sql=sql & email &"','"
sql=sql & homepage &"','"
sql=sql & subject &"','"
sql=sql & password &"',getdate(),0,"
sql=sql & ref &","
sql=sql & step &","
sql=sql & re_level &","
sql=sql & numm &",'"
sql=sql & content &"')"
DbCon.Execute(sql)

DbRec.Close 
Set DbRec = Nothing
DbCon.close
Set DbCon = Nothing

Session("msg")="답변쓰기 성공"
Response.Redirect "board.asp?name="&names&"&page="&page&"&startpage="&startpage
%>
