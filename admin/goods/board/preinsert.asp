<%
if int(Request("degree")) >= 3 then

	name=Replace(Request("name"),"'","''")
	page=Replace(Request("page"),"'","''")
	startpage=Replace(Request("startpage"),"'","''")

	writer=Replace(Request("writer"),"'","''")
	email=Replace(Request("email"),"'","''")
	homepage=Replace(Request("homepage"),"'","''")
	subject=Replace(Request("subject"),"'","''")
	content=Replace(Request("content"),"'","''")
	password=Replace(Request("password"),"'","''")

	set DbCon=Server.CreateObject ("adodb.Connection")
	DbCon.Open "7npoint","sa","Ekdelsl"  

	sqlstmt="Select MAX(numm) from "&name
	Set DbRec = DbCon.Execute(sqlstmt)
	
	If IsNULL(DbRec(0)) Then
	  numm = 1
	else 
	  numm = DbRec(0) + 1
	End If

	 ref = numm
	 step=0
	 re_level=0

	  sql="INSERT INTO "&name&" (nshop_code,goods_code,writer,email,homepage,subject,password,regdate,visited,ref,step,re_level,numm,content)"
	  sql=sql &"values ('"& request("nshop_code") &"','"& request("goods_code") &"','"& writer &"','"
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

	  Session("msg")="입력 성공"
	  Response.Redirect "board.asp?name="&name&"&page="&page&"&startpage="&startpage

else

	if request("page")<>"" then
		page=request("page")
	else
		page=1
	end if
	if request("startpage")<>"" then
		startpage=request("startpage")
	else
		startpage=1
	end if
%>
<html>
<head><title>입력하기</title></head>

<SCRIPT LANGUAGE="JavaScript">
<!--
function yshFocus() {
	window.focus();
	document.form1.writer.focus();
}

function check_form(){
	if(form1.nshop_code.value == ""){
		alert("업체명을 입력해 주세요");
		document.form1.nshop_code.focus();return false;
	}
	if(form1.goods_code.value == ""){
		alert("상품명을 입력해 주세요");
		document.form1.goods_code.focus();return false;
	}	
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
	fncsubmit(document.form1,3);
}

function fncsubmit(form,dr){
	form.degree.value = dr
	form.submit();
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
					<td width=390 background="./images/board_back.gif" align="center"><p class="font9"><font color="#c71585"><b>글쓰기</b></font></td>
					<td width=24 background="./images/board_back.gif" align="right"><a href="board.asp?name=<%=name%>&page=<%=page%>&startpage=<%=startpage%>"><img src="./images/list.gif" border="0" alt="list"></a></td>
					<td width="6"><img src="./images/board_end.gif"></td>
				</tr>
			</table>
			<table width="500" border="0" cellspacing="1" cellpadding="2">
			<form method="post" action="preinsert.asp" name="form1" onSubmit="return check_form();">
				<INPUT TYPE="hidden" name="degree" value="">
				<input type="hidden" name="name" value="<%=Request("name")%>">
				<input type="hidden" name="page" value="<%=page%>">
				<input type="hidden" name="startpage" value="<%=startpage%>">
				<input type="hidden" name="ref" value="<%=request("ref")%>">
				<input type="hidden" name="step" value="<%=request("step")%>">
				<input type="hidden" name="re_level" value="<%=request("re_level")%>">
				<input type="hidden" name="nshop_code" value="<%=session("nshop_id")%>">
				<tr>
					<td width=90  bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품명</font></td>
					<td bgcolor="#ffffe0">
						<select name="goods_code">
							<option value="">상품을 선택해주세요!!</option>
							<option value="">----------------------</option>
<%
	set Conn=Server.CreateObject ("adodb.Connection")
	Conn.Open "7npoint","sa","Ekdelsl"

	sql_goods="select goods_code,goods_name,goods_size from goods_info where nshop_code='"&session("nshop_id")&"' order by goods_name"
	set rs_goods = Conn.Execute(sql_goods)
		
	if not rs_goods.eof then
		do until rs_goods.eof	%>
							<option value="<%=rs_goods("goods_code")%>"><%=rs_goods("goods_name")%>[<%=rs_goods("goods_size")%>]</option>
	<%	rs_goods.movenext
		loop
	end if	%>
						</select>
					</td>
				</tr>
				<tr>
					<td width=90  bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자</font></td>
					<td bgcolor="#ffffe0"><input type="text" name="writer" size="20" maxlength="20"></td>
				</tr>
				<tr>
					<td width=90  bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</font></td>
					<td bgcolor="#ffffe0"><input type="text" name="email" size="50" maxlength="50"></td>
				</tr>
				<tr>
					<td width=90  bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈페이지</font></td>
					<td bgcolor="#ffffe0"><font size=2>http://</font><input type="text" name="homepage" size="45" maxlength="50"></td>
				</tr>
				<tr>
					<td width=90  bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;글제목</font></td>
					<td bgcolor="#ffffe0"><input type="text" name="subject" size="50" maxlength="100"></td>
				</tr>
				<tr>
					<td width=90  bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 용</font></td>
					<td bgcolor="#ffffe0"><textarea name="content" cols="50" rows="7"></textarea></td>
				</tr>
				<tr>
					<td width=90  bgcolor="#f0e68c"><p class="font9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</font></td>
					<td bgcolor="#ffffe0"><input type="password" name="password" size="8" maxlength="8"> <font size="2">수정과 삭제시 필요</font></td>
				</tr>
				<tr>
					<td colspan=2 align=center>&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="글올리기">&nbsp;&nbsp;<input type="reset" value="글지우기"></td>
				</tr>
			</form>
			</table>
<!--#include file=copyright.son-->			
		</td>
	</tr>
</table>
</body>
</html>
<% end if %>
