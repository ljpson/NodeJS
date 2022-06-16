<%
name=Request("name")
page=Request("page")
startpage=Request("startpage")
num=Request("num")

set DbCon=Server.CreateObject ("adodb.Connection")
DbCon.Open "7npoint","sa","Ekdelsl"  

sql="Select * from "&name&" where num="&num
Set Result = DbCon.Execute(sql)

writer=Result("writer")
email=Trim(Result("email"))
homepage=Trim(Result("homepage"))
subject=Result("subject")
content=Result("content")
password=Result("password")

Result.Close
Set Result = Nothing
DbCon.Close
Set DbCon = Nothing
%>
<html>
<head><title> <%=num%>번 글 수정하기</title></head>

<SCRIPT LANGUAGE="JavaScript">
<!--
function yshFocus() {
	window.focus();
	document.form1.writer.focus();
}

function check_form(){
	if(form1.writer.value == ""){
		alert("작성자명을 입력해 주세요");
		document.form1.writer.focus();return false;
	}
	if(form1.subject.value == ""){
		alert("글제목을 입력해 주세요");
		document.form1.subject.focus();return false;
	}
	if(form1.content.value == ""){
		alert("내용을 입력해 주세요");
		document.form1.content.focus();return false;
	}
}
-->
</SCRIPT>

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

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="yshFocus()">
<basefont size="2" face="굴림">
<table border="0" cellpadding="0" cellspacing="0" width="700" align=center>
    <tr>
        <td valign="top" align=center>
			<table border=0 cellspacing=0 cellpadding=0 width=500 align=center>
				<tr>
					<td height=50 align=center><b>상품문의/사용소감</b></td>
				</tr>
			</table>
			<table border=0 cellspacing=0 cellpadding=0 width=500 align=center>
				<tr>
					<td width=110><img src="./images/board_top.gif"></td>
					<td width=390  background="./images/board_back.gif" align="center"><p class="font9"><font color="#c71585"><b>내용 수정하기</b></font></td>
					<td width=24 background="./images/board_back.gif" align="right"><a href="board.asp?name=<%=name%>&page=<%=page%>&startpage=<%=startpage%>"><img src="./images/list.gif" border="0" alt="list"></a></td>
					<td width="6"><img src="./images/board_end.gif"></td>
				</tr>
			</table>
			<table width="500" border="0" cellspacing="1" cellpadding="3">
			<form method="post" action="update.asp" name="form1" onSubmit="return check_form();">
				<input type="hidden" name="name" value="<%=name%>">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="hidden" name="page" value="<%=page%>">
				<input type="hidden" name="startpage" value="<%=startpage%>">
				<tr>
					<td width=90 bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;작성자</font></td>
					<td bgcolor="#ffffe0"><input type="text" name="writer" size="20" maxlength="20" value="<%=writer%>"></td>
				</tr>
				<tr>
					<td width=90 bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;이메일</font></td>
					<td bgcolor="#ffffe0"><input type="text" name="email" size="50" maxlength="50" value="<%=email%>"></td>
				</tr>
				<tr>
					<td width=90 bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;홈페이지</font></td>
					<td bgcolor="#ffffe0"><font size=2>http://</font><input type="text" name="homepage" size="45" maxlength="50" value="<%=homepage%>"></td>
				</tr>
				<tr>
					<td width=90 bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;글제목</font></td>
					<td bgcolor="#ffffe0"><input type="text" name="subject" size="50" maxlength="100" value="<%=subject%>"></td>
				</tr>
				<tr>
					<td width=90 bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;내 용</font></td>
					<td bgcolor="#ffffe0"><textarea name="content" cols="50" rows="10"><%=content%></textarea></td>
				</tr>
				<tr>
					<td width=90 bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;비밀번호</font></td>
					<td bgcolor="#ffffe0"><input type="password" name="password" size="8" maxlength="8"><font size="2">수정과 삭제시 필요</font></td>
				</tr>
				<tr>
					<td colspan=2 align=center><font size=2 color=red><%=Session("updatemsg")%><%Session("updatemsg")=""%>&nbsp;</font></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="수정하기">&nbsp;&nbsp;<input type="reset" value="글지우기"></td>
				</tr>
			</form>
			</table>
<!--#include file=copyright.son-->	
		</td>
	</tr>
</table>
</body>
</html>
