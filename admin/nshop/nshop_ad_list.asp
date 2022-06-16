<html>
<head><title>[NPOINT] 관리자툴 - 업체광고신청목록</title></head>

<style type="text/css">
<!--
	A:link {font-size:9pt;text-decoration:none;}
	A:visited {font-size:9pt;text-decoration:none;}
    A:hover {color:#aa00aa; text-decoration:underline}
	li{font-size:10pt;text-align:justify;text-decoration:none;}
	p{line-height:130%;text-align:justify;font-size:9pt;}
	td {font-size:9pt;}
	.tdcont {line-height:150%;text-align:justify;font-size:9pt;}
	.form {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
	.font9 {  font-size: 10pt; font-family: "굴림체", "Verdana", "sans-serif"}
-->
</style>

<script language="JavaScript">

function namosw_goto_byselect(sel, targetstr)
{
	var index = sel.selectedIndex;
	if (sel.options[index].value != null) {
		var frameobj = eval(targetstr);
		frameobj.location = sel.options[index].value;
	}
}

</script>
<body  bgcolor=#ffffff>
<br><br>
<table width=95% align=center>
	<tr>
		<td align=center valign=middle height=300>
<% if session("nshop_id")="" then %>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>업체광고신청</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td height=150 align=center>
									운영자님이 자리를 비우신 시간이 오래되어<br>
									보안상 관리자모드를 종료시켰습니다.<br>
									다시 로그인 하시고, 사용해 주세요!!<br><br><br>
									<input type=button value="관리자메인" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; height:18px; BORDER:1x solid #778899" onClick="location.replace('../default.asp')" id=button5 name=button5>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
<% else %>
	<%
	nshop_code=Request("nshop_code")

	sort=Request("sort")
	if sort="" then
	sort="idx"
	end if

	order=Request("order")
	if order="" then
	order="ASC"
	end if

	search=Request("search")
	keyword=Request("keyword")  

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
		  DbRec.Open "SELECT * FROM nshop_ad where nshop_code='"&session("nshop_id")&"' ORDER BY "&sort&" "&order , DbCon
		else
		  DbRec.Open "SELECT * FROM nshop_ad where nshop_code='"&session("nshop_id")&"' and "&search&" like '%"&keyword&"%' ORDER BY "&sort&" "&order , DbCon
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

		pg=Request("page")

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
			<table width=100% cellpadding=1 cellspacing=0>
				<tr>
					<td align=center colspan=2><font size=3 color="000000"><b>업체광고신청목록</b></font><br><Br></td>
				</tr>
				<tr>
					<td>
						<table width=100%>
							<tr>
								<td align=right><font size=2 color=red><%=year(now())%>.<%=month(now())%>.<%=day(now())%> 현재 기준입니다</font> <br>
									<font size=2 color=red> 업체광고정보를 변경하실려면 상세보기를 클릭하십시오</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=100% cellpadding=2 cellspacing=3 bgcolor="#EEEECC">
<%if DbRec.EOF then%>
							<tr bgcolor="#EEEECC">
								<td align=center height=50><font color=darkred>신청된 광고가 하나도 없습니다.</font></td>
							</tr>
<%else%>
							<tr>
								<td align="center"><font face="굴림" size="2"></font></td>
								<td align="center"><font face="굴림" size="2">등록자</font></td>
								<td align="center"><font face="굴림" size="2">이메일</font></td>
								<td align="center"><font face="굴림" size="2">전화</font></td>
								<td align="center"><font face="굴림" size="2">승인여부</font></td>
								<td align="center"><font face="굴림" size="2">노출기간</font></td>
								<td align="center"><font face="굴림" size="2">글등록일</font></td>
								<td align="center"><font face="굴림" size="2"></font></td>
							</tr>
	<%	For i = 1 to ipp
			if totpage = curpage then
				value = postcount Mod ipp
				if i > value and value <> 0 then
					Exit For
				end if
			end if %>
							<tr bgcolor=#ffffff>
								<td align="center" class=font9><%=((curpage-1)*10)+i%></td>
								<td align="center" class=font9><%=DbRec("writer")%></td>
								<td class=font9><a href="mailto:<%=DbRec("email")%>"><%=DbRec("email")%></a></td>
								<td align="center" class=font9><%=DbRec("tel")%></td>   
								<td align="center" class=font9><%if DbRec("del")="Y" then%>승인<%else%>접수<%end if%></td> 
								<td align="center"><%=replace(DbRec("start_day"),"-","/")%> ~ <%=replace(DbRec("end_day"),"-","/")%></td>
								<td align="center"><%=year(DbRec("regdate"))%>/<%=month(DbRec("regdate"))%>/<%=day(DbRec("regdate"))%></td>
								<td align="center" class=font9><a href="nshop_ad_detail.asp?idx=<%=DbRec("idx")%>&page=<%=curpage%>&startpage=<%=startpage%>">상세보기</a></td>   
							</tr>
	<%  DbRec.MovePrevious
		Next 

DbRec.Close
Set DbRec = Nothing
DbCon.Close
Set DbCon = Nothing %>
							<tr bgcolor="#EEEECC">
								<td colspan=10 align=right>
									<table border=0 cellpadding=0 cellspacing=0 width=100%>
										<tr>
											<td align=left> 
												<table>
													<tr>
													<form action=../default.asp method=post>
														<td><input type=submit value=HOME  class=inkform></td>
													</form>
													<form action="nshop_ad_list.asp?sort=<%=sort%>&order=<%=order%>" method=post>
														<td><input type=submit value=전체보기 class=inkform></td>
													</form>
													<form action="nshop_ad_input.asp" method=post>
														<td><input type=submit value=업체광고추가 class=inkform></td>
													</form>
													</tr>
												</table>                
											</td>
											<td align=right>
												<table>
													<tr>
													<form action=nshop_ad_list.asp method=post id=form1 name=form1>
														<td>
															<input type=hidden name=search  value="<%=search%>">
															<input type=hidden name=keyword  value="<%=keyword%>">                               
															<input type=hidden name=sort  value="idx">
															<input type=hidden name=order  value="<%if session("order1")="DESC" then%>ASC<%session("order1")="ASC"%><%else%>DESC<%session("order1")="DESC"%><%end if%>">                           
															<input type=submit value=등록순 class=inkform id=submit1 name=submit1>
														</td>
													</form>
													<form action=nshop_ad_list.asp method=post id=form2 name=form2>
														<td>
															<input type=hidden name=search  value="<%=search%>">
															<input type=hidden name=keyword  value="<%=keyword%>">                               
															<input type=hidden name=sort  value="del">
															<input type=hidden name=order  value="<%if session("order2")="DESC" then%>ASC<%session("order2")="ASC"%><%else%>DESC<%session("order2")="DESC"%><%end if%>">                           
															<input type=submit value=승인여부순 class=inkform id=submit2 name=submit2>
														</td>
													</form>
									                </tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
<%end if%>
						</table>
					</td>
				</tr>
				<tr>
					<td align=center><br><br>
						<center>
<%if totpage > ten then%>
	<%if startpage=1 then%>
						<font size="2">◁◁</font>&nbsp;
    <%else%>
						<a class="spage" href="nshop_ad_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=cint(startpage)-ten%>&startpage=<%=cint(startpage)-ten%>"><font size="2">◀◀</font></a>&nbsp;
    <%end if

    For a=startpage to startpage+ten-1
		if a>totpage then
			exit for
        else
				if a=curpage then	%>
						<font color="#ff0000" size="2"><b><%=a%></b></font>
			<%	else	%>
						<font color="#000000" size="2"><a href="nshop_ad_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=a%>&startpage=<%=startpage%>"><%=a%></a></font>
			<%	End if
		end if
    Next
    %>

    <%if((startpage\ten)=(totpage\ten)) then%> 
						&nbsp;<font size="2">▷▷</font>
    <%else%>
						&nbsp;<a class="spage" href="nshop_ad_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=a%>&startpage=<%=a%>"><font size="2">▶▶</font></a>
    <%end if%>

<%else%>
						<font color="#808000" size="2">◁◁</font>&nbsp;
	<%
    For a=startpage to totpage
		if a=curpage then
	%>
						<font color="#ff0000" size="2"><b><%=a%></b></font>
	<%	else%>
						<a href="nshop_ad_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=a%>"><font color="#000000" size="2"><%=a%></font></a>
	<%	end if
    next
    %>
						&nbsp;<font color="#808000" size="2">▷▷</font>
<%end if%>

						<br>
					</td>
				</tr>
			</table>
<% end if %>
		</td>
	</tr>
 </table>
</body>
</html>