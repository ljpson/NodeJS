<%
if session("nshop_id")="" then
	Response.Redirect("../default.asp")
end if
%>
<%
goods_code=request("goods_code")
  
sort=Request("sort")
if sort="" then
sort="goods_idx"
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
  DbRec.Open "SELECT * FROM goods_info where nshop_code='"&session("nshop_id")&"' and del='N' ORDER BY "&sort&" "&order , DbCon
else
  DbRec.Open "SELECT * FROM goods_info where nshop_code='"&session("nshop_id")&"' and del='N' and "&search&" like '%"&keyword&"%' ORDER BY "&sort&" "&order , DbCon
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

	pg=Request.QueryString("page")

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
<head><title>[NPOINT] 관리자툴 - NSHOP 삭제된 상품목록</title></head>

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
		<td align=center>
			<table width=100% cellpadding=1 cellspacing=0 border=0>
<%
	Sqlnn="SELECT nshop_kname from nshop_info where nshop_code='"&session("nshop_id")&"'"
	Set rsnn=DbCon.Execute(Sqlnn) %>			
				<tr>
					<td align=center colspan=2><font size=3 color="000000"><b>[<%=rsnn("nshop_kname")%>] 삭제된 상품목록</b></font><br><Br></td>
				</tr>
				<tr>
					<td>
						<table width=100%>
							<tr>
								<td align=right><font size=2 color=red><%=year(now())%>.<%=month(now())%>.<%=day(now())%> 현재 기준입니다</font> <br>
									<font size=2 color=red> 상품정보를 변경하실려면 상품명을 클릭하십시오</font>
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
								<td align=center height=50><font color=darkred>찾고자 하시는 상품이 없습니다.</font></td>
							</tr>
<%else%>
							<tr>
								<td align="center" colspan=2><font face="굴림" size="2">이미지</font></td>
								<td align="center"><font face="굴림" size="2">상품코드</font></td>
								<td align="center"><font face="굴림" size="2">상품명</font></td>
								<td align="center"><font face="굴림" size="2">상품규격</font></td>
								<td align="center"><font face="굴림" size="2">상품가격<br>(원)</font></td>
								<td align="center"><font face="굴림" size="2">할인가격<br>(원)</font></td>
								<td align="center"><font face="굴림" size="2">적립<br>포인트</font></td>
								<td align="center"><font face="굴림" size="2">판매타입<br>(보유량)</font></td>
								<td align="center"><font face="굴림" size="2">카테고리</font></td>
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
								<td align="center"><% if DbRec("S_image")="" then %>없음<% else %><img src="../../../npoint/images/goods/<%=DbRec("nshop_code")%>/<%=DbRec("S_image")%>" height=40><% end if %></td>
								<td align="center" class=font9><%=DbRec("goods_code")%></td>
								<td align="center" class=font9><a href="goods_detail.asp?goods_idx=<%=DbRec("goods_idx")%>&page=<%=curpage%>&startpage=<%=startpage%>"><%=DbRec("goods_name")%></a></td>
								<td align="center" class=font9><%=DbRec("goods_size")%></td>
								<td align="center" class=font9><%=DbRec("goods_price")%></td>                
								<td align="center" class=font9><%if DbRec("goods_type")="2" then%><%=DbRec("goods_discount_price")%><%else%>&nbsp;<%end if%></td>   
								<td align="center" class=font9><%=DbRec("award_amount")%></td> 
		<%	Select Case DbRec("sale_type")
				Case "0" sale_type = "품절" 
				Case "1" sale_type = "한정판매" 
				Case "2" sale_type = "무한판매" 
			End Select %>
								<td align="center" class=font9><%=sale_type%><br><%if DbRec("sale_type")="1" then%>(<%=DbRec("capacity")%>)<%end if%></td> 
								<td align="center" class=font9>
									<table border=0 cellpadding=0 cellspacing=0 width=100%>
<%	sql_ca="SELECT * FROM goods_category where goods_code='"&DbRec("goods_code")&"' ORDER BY goods_category"
	set rs_ca = Dbcon.Execute(sql_ca)
	if rs_ca.eof then
		ca="카테고리 미등록" %>
										<tr>
											<td><%=ca%></td>
										</tr>
<%	else
		do until rs_ca.eof
			sql_ca1 = "SELECT first_name FROM goods_first where first_code='"&left(rs_ca("goods_category"),2)&"'"
			set rs_ca1 = Dbcon.Execute(sql_ca1)
				ca=rs_ca1(0)
			set rs_ca1 = nothing
			
			sql_ca2 = "SELECT second_name FROM goods_second where first_code='"&left(rs_ca("goods_category"),2)&"' and second_code='"&mid(rs_ca("goods_category"),3,2)&"'"
			set rs_ca2 = Dbcon.Execute(sql_ca2)
				if not rs_ca2.eof then
					ca=ca&":"&rs_ca2(0)
				end if
			set rs_ca2 = nothing
			
			sql_ca3 = "SELECT third_name FROM goods_third where first_code='"&left(rs_ca("goods_category"),2)&"' and second_code='"&mid(rs_ca("goods_category"),3,2)&"' and third_code='"&right(rs_ca("goods_category"),2)&"'"
			set rs_ca3 = Dbcon.Execute(sql_ca3)
				if not rs_ca3.eof then
					ca=ca&":"&rs_ca3(0)
				end if
			set rs_ca3 = nothing %>
										<tr>
											<td>
									<% if isnull(rs_ca("regdate")) then%>
												<%=ca%>
									<% else %>
										<% if datediff("s",cdate(rs_ca("regdate")) ,now) <=100 then%>
												<font color=darkred><%=ca%></font>
										<%else%>
												<%=ca%>
										<%end if%>
									<% end if %>
											</td>
										</tr>
	<%	rs_ca.movenext
		loop %>
<%	end if
	set rs_ca = nothing	 %>
									</table>
								</td>
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
													<form action="goods_del_list.asp?sort=<%=sort%>&order=<%=order%>" method=post>
														<td><input type=submit value=전체보기 class=inkform></td>
													</form>
													<form action="goods_input.asp" method=post>
														<td><input type=submit value=상품추가 class=inkform></td>
													</form>
													</tr>
												</table>                
											</td>
											<td align=right>
												<table>
													<tr>
													<form action=goods_del_list.asp method=post>
														<td> 
															<input type=hidden name=search  value="<%=search%>">
															<input type=hidden name=keyword  value="<%=keyword%>">                               
															<input type=hidden name=sort  value="goods_name">
															<input type=hidden name=order  value="DESC">                          
															<input type=submit value=상품명순 class=inkform>
														</td>
													</form>
													<form action=goods_del_list.asp method=post>
														<td> 
															<input type=hidden name=search  value="<%=search%>">
															<input type=hidden name=keyword  value="<%=keyword%>">                               
															<input type=hidden name=sort  value="goods_price">
															<input type=hidden name=order  value="DESC">                           
															<input type=submit value=상품가격순 class=inkform>
														</td>
													</form>
													<form action=goods_del_list.asp method=post>
														<td>
															<input type=hidden name=search  value="<%=search%>">
															<input type=hidden name=keyword  value="<%=keyword%>">                               
															<input type=hidden name=sort  value="goods_discount_price">
															<input type=hidden name=order  value="DESC">                           
															<input type=submit value=할인가격순 class=inkform>
														</td>
													</form>
													<form action=goods_del_list.asp method=post>
														<td>
															<input type=hidden name=search  value="<%=search%>">
															<input type=hidden name=keyword  value="<%=keyword%>">                               
															<input type=hidden name=sort  value="award_amount">
															<input type=hidden name=order  value="DESC">                           
															<input type=submit value=적립포인트순 class=inkform>
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
					<td align=center>
						<table border="0" width=100%>
							<tr>
								<td width=30%></td>
								<td width=40% align=center>
        							<table border="0">
										<form name="form4" method="Post" action="goods_del_list.asp">                  			
				    					<tr>
				    						<td class="font9">
												<select name="search" style="background:#Fdfcf4">
													<option value="goods_code"selected>상품코드</option>
													<option value="goods_name">상품명</option>
													<option value="goods_size">상품규격</option>
												</select>                            			
				    						</td>
				    						<td class="font9">
				    							<input type=text name=keyword style="border: 1px dashed; background:#Fdfcf4" size="11">
												<input type=hidden name=sort value="<%=sort%>">
												<input type=hidden name=order value="<%=order%>">
											</td>
											<td class="font9"><INPUT type="submit" value="검색" id=submit3 name=submit3></td>
				    					</tr>
										</form>
									</table>
								</td>
								<td width=30%></td>
							</tr>
						</table>
						<br>
						<center>
<%if totpage > ten then%>
	<%if startpage=1 then%>
						<font size="2">◁◁</font>&nbsp;
    <%else%>
						<a class="spage" href="goods_del_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=cint(startpage)-ten%>&startpage=<%=cint(startpage)-ten%>"><font size="2">◀◀</font></a>&nbsp;
    <%end if

    For a=startpage to startpage+ten-1
		if a>totpage then
			exit for
        else
				if a=curpage then	%>
						<font color="#ff0000" size="2"><b><%=a%></b></font>
			<%	else	%>
						<font color="#000000" size="2"><a href="goods_del_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=a%>&startpage=<%=startpage%>"><%=a%></a></font>
			<%	End if
		end if
    Next
    %>

    <%if((startpage\ten)=(totpage\ten)) then%> 
						&nbsp;<font size="2">▷▷</font>
    <%else%>
						&nbsp;<a class="spage" href="goods_del_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=a%>&startpage=<%=a%>"><font size="2">▶▶</font></a>
    <%end if%>

<%else%>
						<font color="#808000" size="2">◁◁</font>&nbsp;
	<%
    For a=startpage to totpage
		if a=curpage then
	%>
						<font color="#ff0000" size="2"><b><%=a%></b></font>
	<%	else%>
						<a href="goods_del_list.asp?search=<%=search%>&keyword=<%=keyword%>&sort=<%=sort%>&order=<%=order%>&page=<%=a%>"><font color="#000000" size="2"><%=a%></font></a>
	<%	end if
    next
    %>
						&nbsp;<font color="#808000" size="2">▷▷</font>
<%end if%>

						<br>
					</td>
				</tr>
			</table>
		</td>
	</tr>
 </table>
</body>
</html>