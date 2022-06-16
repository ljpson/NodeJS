<%
name=Request("name")
num=cint(Request("num"))
curpage=Request("page")
startpage=Request("startpage")

set DbCon=Server.CreateObject ("adodb.Connection")
DbCon.Open "7npoint","sa","Ekdelsl"  

SQLstmt="SELECT * FROM "&name&" WHERE num="&num
Set Result=DbCon.Execute(SQLstmt)

content=Result("content")
'content=Replace(content, "&" , "&amp;")
'content=Replace(content, "<" , "&lt;")
'content=Replace(content, ">" , "&gt;")
content=Replace(content,chr(13),"<br>") 

SQLstmt = "SELECT MAX(num) as lastnum FROM " & name 
Set Rs = DbCon.Execute(SQLstmt)
lastnumber = rs("lastnum")
rs.close

SQLstmt = "SELECT MIN(num) as firstnum FROM " & name 
Set Rs = DbCon.Execute(SQLstmt)
firstnumber = rs("firstnum")
rs.close

SQLstmt = "SELECT MAX(num) as prevnum FROM " & name & " WHERE num < " & num
Set Rs = DbCon.Execute(SQLstmt)
prevnumber = rs("prevnum")
rs.close

SQLstmt = "SELECT MIN(num) as nextnum FROM " & name & " WHERE num > " & num
Set Rs = DbCon.Execute(SQLstmt)
nextnumber = rs("nextnum")
rs.close
%>

<html>
<head><title>내용보기</title></head>

<style type="text/css">
<!--
.font9 {  font-size: 9pt; font-family: "굴림", "Verdana", "sans-serif"}

A:visited {
	font-family : "굴림", "Verdana", "sans-serif";
	font-size: 9pt;
	color: #333399;
	text-decoration: none;
}

A:hover {
	font-family: "굴림", "Verdana", "sans-serif";
	font-size: 9pt;
	color:#009AFF;
	text-decoration: underline;
}

A:active {  
	font-family : "굴림", "Verdana", "sans-serif";
	font-size: 9pt;
	color: #333399;
	text-decoration: none;
} 

A:link {  
	font-family : "굴림", "Verdana", "sans-serif";
	font-size: 9pt;
	color: #333399;
	text-decoration: none;
} 
 -->
</style>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<basefont size="2" face="굴림">
<table border="0" cellpadding="0" cellspacing="0" width="700" align=center>
    <tr>
        <td valign="top" align=center>
			<table border=0 cellspacing=0 cellpadding=0 width=500 align=center>
				<tr>
					<td height=50 align=center><b>상품문의/사용소감</b></td>
				</tr>
			</table>
			<table width=500 align=center border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width=60><img src="./images/board_top02.gif"></td>
					<td align=center background="./images/board_back.gif">
						<font size=2>
						| <a href="board.asp?name=<%=name%>&page=<%=curpage%>&startpage=<%=startpage%>"><img src="./images/list.gif" alt="list" border="0"></a> | 
					<% if num = firstnumber then%>
						<img src="./images/pre.gif" alt="previous" border="0"> | 
					<% else %>
						<a href="content.asp?name=<%=name%>&num=<%=prevnumber%>&page=<%=curpage%>&startpage=<%=startpage%>"><img src="./images/pre.gif" alt="previous" border="0"></a> | 
					<% end if %> 	
					<% if num = lastnumber then%>
						<img src="./images/next.gif" alt="next" border="0">
					<% else %>
					    <a href="content.asp?name=<%=name%>&num=<%=nextnumber%>&page=<%=curpage%>&startpage=<%=startpage%>"><img src="./images/next.gif" alt="next" border="0"></a>
					<% end if %>
						| <a href="preupdate.asp?name=<%=name%>&num=<%=Result("num")%>&page=<%=curpage%>&startpage=<%=startpage%>"><img src="./images/modify.gif" alt="modify" border="0"></a>  
						| <a href="preanswer.asp?name=<%=name%>&num=<%=Result("num")%>&page=<%=curpage%>&startpage=<%=startpage%>"><img src="./images/reply.gif" alt="reply" border="0"></a> 
						| <a href="predelete.asp?name=<%=name%>&num=<%=Result("num")%>&page=<%=curpage%>&startpage=<%=startpage%>"><img src="./images/del.gif" alt="delete" border="0"></a>
						| 
						</font>
					</td>  
					<td align=center width=54 background="./images/board_back.gif">
						<a href="preinsert.asp?name=<%=name%>&page=<%=curpage%>&startpage=<%=startpage%>"><img src="./images/write.gif" border="0" alt="글쓰기"></a></td>
					<td width="6"><img src="./images/board_end.gif"></td>
				</tr>
			</table>
			<%
			  if Left(Result("regdate"),4)<>"2000" then
			    mo_regdate="20"&Result("regdate")
			  else
			    mo_regdate=Result("regdate")
			  end if
			%>
			<table align=center border="0" cellpadding="5" cellspacing=1 width=500>
				<tr bgcolor="#f0e68c" height="15">
					<td align="center" colspan=4><font size="4"><p class="font9"><font color="#c71585"><%=Result("subject")%></font></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#fdf5e6">
						<font color="#808080" size="2"><p class="font9">번호:</font><font color="#0000ff" size="2"><%=Result("num")%></font>
					</td>
					<td align="center" bgcolor="#f5fffa">
						<font color="#808080" size="2"><p class="font9">작성자:</font><font color="#000000" size="2"> <a href="mailto:<%=Result("email")%>"><b><u><%=Result("writer")%></u></b></a></font>
					</td>
					<td align="center" bgcolor="#ffffe0">
						<font color="#808080" size="2"><p class="font9">작성일:</font><font color="#000000" size="2"><%=mo_regdate%></font>
					</td>
					<td align="center" bgcolor="#fff0f5">
						<font color="#808080" size="2"><p class="font9">조회수:</font><font color="#ff0000" size="2"><%=Result("visited")%> </font> &nbsp;
					</td>
				</tr>
			<%if Trim(Result("homepage")) <> ""  then%>
				<tr bgcolor="#B0E0E6">
					<td align=center colspan=4>
						<font size=-1>홈페이지 : <a href="http://<%=Result("homepage")%>" target="homepage">http://<%=Result("homepage")%></a></font>
					</td>
				</tr>
			<%end if%>
				<tr bgcolor="#ffffff">
					<td colspan=4>
						<table width=350 align=center border=0>
							<tr>
								<td width=350><font color="#000000" size="2"><br><%=content%><br><br></font></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table width=500 align=center border="0">
				<tr>
					<td align=center width=60>&nbsp;</td>
					<td align=center>
						<font size=2>
						| <a href="board.asp?name=<%=name%>&page=<%=curpage%>&startpage=<%=startpage%>">List</a> | 
					<% if num = firstnumber then%>
						Previous | 
					<% else %>
						<a href="content.asp?name=<%=name%>&num=<%=prevnumber%>&page=<%=curpage%>&startpage=<%=startpage%>">Previous</a> | 
					<% end if %> 	
					<% if num = lastnumber then%>
						Next
					<% else %>
						<a href="content.asp?name=<%=name%>&num=<%=nextnumber%>&page=<%=curpage%>&startpage=<%=startpage%>">Next</a>
					<% end if %>
						| <a href="preupdate.asp?name=<%=name%>&num=<%=Result("num")%>&page=<%=curpage%>&startpage=<%=startpage%>">Modify</a>  
						| <a href="preanswer.asp?name=<%=name%>&num=<%=Result("num")%>&page=<%=curpage%>&startpage=<%=startpage%>">Reply</a> 
						| <a href="predelete.asp?name=<%=name%>&num=<%=Result("num")%>&page=<%=curpage%>&startpage=<%=startpage%>">Delete</a> 
						| </font>
					</td>  
					<td align=center width=60><a href="preinsert.asp?name=<%=name%>&page=<%=curpage%>&startpage=<%=startpage%>"><font size=2>글쓰기</font></a></td>
					</td>
				</tr>
			</table>
<%
  SQLstr="UPDATE " & name & " SET visited=visited+1 WHERE num = " & num
  DbCon.Execute(SQLstr)
%>
<%
  Set rs = Nothing
  Result.Close
  Set Result = Nothing
  DbCon.Close
  Set DbCon = Nothing
%>
<!--#include file=copyright.son-->
		</td>
	</tr>
</table>
</body>
</html>