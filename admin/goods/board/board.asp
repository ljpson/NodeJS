<%
name=Request("name")
if name="" then
name="goods_board"
end if
num=Request("num")
search=Request("search")
keyword=Trim(Replace(Request("keyword"),"'","''"))

if Request("page")="" then
	curpage=1
else
	curpage=cint(Request("page"))
end if

if Request("startpage")="" then
	startpage=1
else
	startpage=cint(Request("startpage"))
end if

ipp=10
ten=10

set DbCon=Server.CreateObject ("adodb.Connection")
DbCon.Open "7npoint","sa","Ekdelsl"  

Set DbRec=Server.CreateObject("ADODB.Recordset")
DbRec.CursorType=1

if keyword="" then
	DbRec.Open "SELECT * FROM "&name&" where nshop_code='"&session("nshop_id")&"' ORDER BY ref ASC, step DESC", DbCon
else
if search="goods_name" then
	DbRec.Open "SELECT * FROM "&name&" where nshop_code='"&session("nshop_id")&"' and goods_code in(select goods_code from goods_info where "&search&" like '%" & keyword & "%')  ORDER BY ref ASC, step DESC", DbCon
else
	DbRec.Open "SELECT * FROM "&name&" where nshop_code='"&session("nshop_id")&"' and "&search&" like '%" & keyword & "%'  ORDER BY ref ASC, step DESC", DbCon
end if
end if

if Not DbRec.EOF then
	DbRec.MoveLast
end if

postcount=DbRec.Recordcount

totpage=int(postcount/ipp)
totpage=cint(totpage)

if(totpage * ipp) <> postcount then totpage = totpage + 1

	For a=1 to (curpage-1) * ipp
	DbRec.MovePrevious
	Next 

	if Request.QueryString("xx")="div" then
		pg=Request("page")
		if pg<=ten then
			startpage=1
		elseif pg>ten and pg mod ten=0 then
			startpage=pg-(ten-1)
		elseif pg>ten and pg mod ten<>0 then
			startpage=pg-((pg mod ten)-1)
		end if
	else
		pg=Request.QueryString("page")
	end if

	if isEmpty(pg) then
		pg=1
	else
		pg=pg+0
	end if

	if pg<1 then
		pg=1
	end if

	lastpg=1+Int((postcount-1)/ipp)
	if pg>lastpg then
		pg=lastpg
	end if

	nextpg=pg+1
	prevpg=pg-1
	endpg=pg*ipp
	startpg=endpg-ipp+1
%>
<html>
<head><title>목록보기</title></head>

<script language=javascript>
<!--
function check_form(){
	if(form1.keyword.value == ""){
		alert("검색어를 입력해 주세요");
		document.form1.keyword.focus();return false;
	}
}
-->
</script>

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
			<table border=0 cellspacing=0 cellpadding=0 width=700 align=center>
				<tr>
					<td height=50 align=center><b>상품문의/사용소감</b></td>
				</tr>
			</table>
<% if session("nshop_id")="" then %>
				<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
					<tr>
						<td height=150 align=center class=font9>
							운영자님이 자리를 비우신 시간이 오래되어<br>
							보안상 관리자모드를 종료시켰습니다.<br>
							다시 로그인 하시고, 사용해 주세요!!<br><br><br>
							<input type=button value="관리자메인" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; height:18px; BORDER:1x solid #778899" onClick="location.replace('../../default.asp')" id=button5 name=button5>
						</td>
					</tr>
				</table>
<% else %>
			<%If s = "fail" then%>
			<br>
			<font face="굴림" size=2>검색어 "<font color=red><b><%=Replace(keyword,"''","'")%></b></font>"에 해당하는 글이 없습니다.<font face="돋움" color=green> (검색어으로 검색됨)</font></font>
			<br>
			<%else%>
			<%if not keyword="" then%>
			<br>
			<font face="굴림" size=2>검색어 "<font color=red><b><%=Replace(keyword,"''","'")%></b></font>"에 해당하는 글이 "<b><%=postcount%></b>"건 있습니다.<font face="돋움" color=green> (검색어로 검색됨)</font></font>
			<br>
			<% end if %>


			<table border=0 cellspacing=0 cellpadding=0 width=700 align=center>
				<tr>
					<td width=110><img src="./images/board_top.gif"></td>
					<td align=center background="./images/board_back.gif">
						<font size=2>
						<%if prevpg<1 or DbRec.EOF then%>
						| First | 
						<%else%>
						| <a href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=1&startpage=1">First</a> | 
						<%end if%>

						<%if prevpg<1 or DbRec.EOF then%>
						 Previous 
						<%else%>
						<a href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=<%=prevpg%>&<%if prevpg>=ten and (prevpg mod ten=0) then%>startpage=<%=prevpg-(ten-1)%><%else%>startpage=<%=startpage%><%end if%>">Previous</a> 
						<%end if%>

						<%if nextpg > lastpg or DbRec.EOF then%>
						| Next | 
						<%else%>
						| <a href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=<%=nextpg%>&<%if nextpg>=ten and (nextpg mod ten=1) then%>startpage=<%=nextpg%><%else%>startpage=<%=startpage%><%end if%>">Next</a> | 
						<%end if%>

						<%if nextpg > lastpg or DbRec.EOF then%>
						Last |
						<%else%>
						<a href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=<%=lastpg%>&startpage=<%if totpage/ten<>1 then%><%=(totpage-(totpage mod ten))+1%><%else%><%=totpage-(ten-1)%><%end if%>">Last</a> |
						<%end if%>
						</font>
					</td>
					<td width=104 align=right valign=middle background="./images/board_back.gif">
						<table border=0 cellspacing=0 cellpadding=0>
						<form method="post" name="page_form" action="board.asp?xx=div">
							<tr>
								<td><font size=1 color=#808080>Total:</font><font size=1><%=postcount%></font>&nbsp;</td>
								<td>
										<input type=hidden name="name" value="<%=name%>">
										<select name=page onChange="this.form.submit()">
										<%for r = 1 to totpage%>
											<%if r>totpage then
												exit for
											end if%>
											<option value="<%=r%>" <%if r=curpage then%>selected<%end if%>><%=r%>/<%=totpage%>
										<%next%>
										</select>
								</td>
								<td width="6"><img src="./images/board_end.gif"></td>
							</tr>
						</form>
					</table>
				</tr>
			</table>

			<table align=center width="700" cellpadding=2 cellspacing=1 border="0">
				<tr height=20  bgcolor="#f0e68c">
					<th align=center width="35" valign="middle"><p class="font9">번호</font></th>
					<th align=center width="200" valign="middle"><p class="font9">상품명[규격]</font></th>
					<th align=center width="80" valign="middle"><p class="font9">작성자</font></th>
					<th align=center width="270" valign="middle"><p class="font9">제  목</font></th>
					<th align=center width="80" valign="middle"><p class="font9">작성일</font></th>
					<th align=center width="35" valign="middle"><p class="font9">조회</font></th>
				</tr>
<%	if DbRec.EOF then%>
				<tr valign=middle bgcolor="#ffffff">
					<td align="center" colspan=6 height=50><font color=#333333 size="2">현재 등록된 글이 한건도 없습니다.</font></td>
				</tr>
<%	else %>

			<%
			  For i = 1 to ipp
			  if totpage = curpage then
			    value = postcount Mod ipp
			    if i > value and value <> 0 then
			      Exit For
			    end if
			  end if

				if Right(Left(DbRec("regdate"),10),1)="오" then
				  mo_regdate="20"&Left(DbRec("regdate"),8)
				else
				  mo_regdate=Left(DbRec("regdate"),10)
				end if
			%>
				<tr align=middle bgcolor="#ffffff">
					<td align="right"><font color=#0000ff size="2"><%=DbRec("num")%>&nbsp;</font></td>
<%	sql_goodsname="select * from goods_info where goods_code='"&DbRec("goods_code")&"'"
	set rs_goodsname = DbCon.Execute(sql_goodsname) %>
					<td align="center" class=font9><%=rs_goodsname("goods_name")%>[<%=rs_goodsname("goods_size")%>]</font></a></td>
					<td align="center"><a href="mailto:<%=DbRec("email")%>"><font color="#000000" size="2"><%=DbRec("writer")%></font></a></td>
					<td align="left">
					<% if DbRec("re_level") > 0 then %>
						<% wid = 6 * DbRec("re_level") %>
						<p><img src="images/blank.gif" width="<%=wid%>"><img src="images/re1.gif" width="26">
					<%end if%>

					<%if len(DbRec("subject")) > 40 then%>
						<a href="Content.asp?name=<%=name%>&num=<%=DbRec("num")%>&page=<%=curpage%>&startpage=<%=startpage%>">
<!--					<font size="2"><%=left(DbRec("subject"),40)%>...</font></a>-->
						<font size="2"><%=DbRec("subject")%></font></a>
					<%else%>
						<a href="Content.asp?name=<%=name%>&num=<%=DbRec("num")%>&page=<%=curpage%>&startpage=<%=startpage%>">
						<font size="2"><%=DbRec("subject")%></font></a>
					<%end if%>
					</td>
					<td align="center"><font size="2"><%'=DbRec("regdate")%><%=mo_regdate%></font></td>
					<td align="right"><font color=#ff0000 size="2"><%=DbRec("visited")%>&nbsp;</font></td>
				</tr>
			<%
			  DbRec.MovePrevious
			  Next
			%>
<%
  DbRec.Close
  Set DbRec = Nothing
  DbCon.Close
  Set DbCon = Nothing
%>

<%	end if%>
			</table>
			<table width=700 align=center>
				<tr>
					<td align=right><a href="preinsert.asp?name=<%=name%>"><img src="./images/write.gif" border="0" alt="글쓰기"></a></td>
				</tr>
			</table>

	<%if totpage > ten then%>
		<%if startpage=1 then%>
			<font size="2">◁◁</font>
		<%else%>
			<a class="spage" href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=<%=cint(startpage)-ten%>&startpage=<%=cint(startpage)-ten%>"><font size="2">◀◀</font></a>
		<%end if%>

		<%For a=startpage to startpage+ten-1
				if a>totpage then
					exit for
				else
					if a=curpage then
		%>
            <font color="#ff0000" size="2"><b><%=a%></b></font>
					<%else%>
            <font color="#000000" size="2"><a href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=<%=a%>&startpage=<%=startpage%>"><%=a%></a></font>
					<%End if%>
				<%end if%>
		<%Next%>

		<%if((startpage\ten)=(totpage\ten)) then%> 
			<font size="2">▷▷</font>
		<%else%>
			<a class="spage" href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=<%=a%>&startpage=<%=a%>"><font size="2">▶▶</font></a>
		<%end if%>

	<%else%>
			<font color="#808000" size="2">◁◁</font>
		<%For a=startpage to totpage
			if a=curpage then%>
		    <font color="#ff0000" size="2"><b><%=a%></b></font>
			<%else%>
			<a href="board.asp?search=<%=search%>&keyword=<%=keyword%>&name=<%=name%>&page=<%=a%>"><font color="#000000" size="2"><%=a%></font></a>
			<%end if%>
		<%next%>
			<font color="#808000" size="2">▷▷</font>
	<%end if%>
<% end if %>
			<br>
			<table align=center border=0 cellspacing=0 cellpadding=5>
				<tr>
					<td>
						<table align=center border=0 cellspacing=0 cellpadding=5>
						<form method="post" action="board.asp" name="form1" onSubmit="return check_form()">
							<input type="hidden" name="name" value="<%=name%>">
							<tr>
								<td valign=middle>
									<select name="search">
										<option value="subject"<%if search="subject" then%> selected<%end if%>>제목
										<option value="writer"<%if search="writer" then%> selected<%end if%>>이름
										<option value="content"<%if search="content" then%> selected<%end if%>>내용
										<option value="goods_name"<%if search="goods_name" then%> selected<%end if%>>상품명
									</select>
									&nbsp;
									<input type="text" size=16 name="keyword" onFocus="this.select()" value="<%=keyword%>">
									<input type="submit" value="검 색">
								</td>
							</tr>
						</form>
						</table>
					</td>
				</tr>
			</table>
<!--#include file=copyright.son-->
<% end if %>
		</td>
	</tr>
</table>
</body>
</html>