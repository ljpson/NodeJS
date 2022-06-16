<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT * from nshop_ad where idx="&request("idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>[NPOINT] 관리자툴 - 업체광고신청수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
	if (document.reg.nshop_code.value == "" ) {	alert("업체코드을 입력하십시오 "); document.reg.nshop_code.focus(); return false; }
	if (document.reg.first_code.value == "" ) {	alert("광고가 보여질 카테고리를 입력하십시오 "); document.reg.first_code.focus(); return false; }
	if (document.reg.writer.value == "" ) {	alert("등록자를 입력하십시오 "); document.reg.writer.focus(); return false; }
	if (document.reg.email.value == "" ) {	alert("이메일을 입력하십시오 "); document.reg.email.focus(); return false; }
	if (document.reg.content.value == "" ) { alert(" 업체소식을 자세히 입력하십시오 "); document.reg.content.select(); return false; }
// 전화번호
	if (document.reg.tel1.value == "" ) {	alert("지역번호를 입력하십시오 "); document.reg.tel1.focus(); return false; }
	var tel1=document.reg.tel1.value;
	var ichk=0;
	for (var i=0;i<tel1.length;i++) {
		var ch1 = tel1.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("지역번호를 숫자로 입력하십시오 "); document.reg.tel1.focus(); return false; }

	if (document.reg.tel2.value == "" ) {	alert("전화번호를 입력하십시오 "); document.reg.tel2.focus(); return false; }
	var tel2=document.reg.tel2.value;
	var ichk=0;
	for (var i=0;i<tel2.length;i++) {
		var ch1 = tel2.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("전화번호를 숫자로 입력하십시오 "); document.reg.tel2.focus(); return false; }
	
	if (document.reg.tel3.value == "" ) {	alert("전화번호를 입력하십시오 "); document.reg.tel3.focus(); return false; }
	var tel3=document.reg.tel3.value;
	var ichk=0;
	for (var i=0;i<tel3.length;i++) {
		var ch1 = tel3.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("전화번호를 숫자로 입력하십시오 "); document.reg.tel3.focus(); return false; }
	fncsubmit(document.reg,5);
}
function fncsubmit(form,dr){
	form.degree.value = dr
	form.submit();
}
</SCRIPT> 
<STYLE TYPE="text/css">
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
//-->
</style>
<body text="#222222" link="#004cb3" vlink="#b300a9" alink="#ca2204">
<table width=700 align=center>
	<tr>
		<td align=center>
		<td align=center valign=middle height=400>
<%	if int(Request.form("degree")) >= 5 then

page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  
			
	idx=request("idx")
	nshop_code=request("nshop_code")
	ad_category=request("first_code")&request("second_code")
	tel=request("tel1")&"-"&request("tel2")&"-"&request("tel3")

		start_y=request("start_y")
		start_m=request("start_m")
			if cint(start_m)<10 then
				start_m="0"&request("start_m")
			end if
		start_d=request("start_d")
			if cint(start_d)<10 then
				start_d="0"&request("start_d")
			end if
	start_day=start_y&"-"&start_m&"-"&start_d

		end_y=request("end_y")
		end_m=request("end_m")
			if cint(end_m)<10 then
				end_m="0"&request("end_m")
			end if
		end_d=request("end_d")
			if cint(end_d)<10 then
				end_d="0"&request("end_d")
			end if
	end_day=end_y&"-"&end_m&"-"&end_d
	
	Ins="update nshop_ad set nshop_code='"&nshop_code&"',ad_category='"&ad_category&"',writer='"&request("writer")&"',email='"&_
		request("email")&"',content='"&request("content")&"',tel='"&tel&"',start_day='"&_
		start_day&"',end_day='"&end_day&"',regdate=getdate(),del='"&request("del")&"' where idx='"&idx&"'"
	Conn.Execute(Ins)	%>
		<table width=500 cellpadding=5 cellspacing=3 bgcolor="#EEEECC">
			<tr>
				<td align=center height=200 valign=middle class="font9" colspan=2>
					정상적으로 수정되었습니다!! <BR>
					업체광고신청목록에서 확인하시고,<br> 잘못 기입된 부분이 있으면 수정해 주세요!!
					<br><br>
					<table align=center>
						<tr>
							<td><INPUT type="button" value="메인화면" class=form style="CURSOR: hand" onclick="location.replace('../npoint_admin.asp');" id=button1 name=button1></td>
							<td><INPUT type="button" value="이전화면으로" class=form style="CURSOR: hand" onclick="javascript:history.back(-1);" id=button2 name=button2></td>
							<td><input type=button  value="업체광고신청목록" class=form style="CURSOR: hand" onclick="location.replace('nshop_ad_list.asp?page=<%=page%>&startpage=<%=startpage%>');" id=button3 name=button3></td>
						</tr>
					</table>
				</td>
			</tr>		
		</table>
<%	else	%>
		<form action=nshop_ad_edit.asp method=post  name="reg"   onSubmit="return check_len(this)">
			<INPUT TYPE="hidden" name="nshop_code" value="<%=rs("nshop_code")%>">
			<INPUT TYPE="hidden" name="degree" value="">
			<input type=hidden name=idx size=20 maxlength=10 class="form" value="<%=rs("idx")%>">
			<input type=hidden name=page size=20 maxlength=10 class="form" value="<%=page%>">
			<input type=hidden name=startpage size=20 maxlength=10 class="form" value="<%=startpage%>">
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>업체광고신청수정</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td width=15 rowspan=14></td>
								<td height=10 colspan=4></td>
							</tr>  
							<tr>
								<td><font size=2>카테고리</font></td>
								<td valign=bottom align=left colspan=3>
	<%	sqlca = "SELECT * FROM nshop_first WHERE first_code IN (SELECT first_code FROM nshop_second WHERE second_qty <> 0 GROUP BY first_code HAVING COUNT(first_code) > 1)"
		set rsca = Conn.Execute(sqlca)
		
		if rsca.eof then	%>
									광고를 삽입할 수 있는 카테고리가 아직 준비되지 않았습니다.
	<%	else	%>
						        	<select name="first_code" style="background:#Fdfcf4" onchange="javascript:fncsubmit(document.reg,2)">
										<option value="">첫번째 카테고리</option>
										<option value="">---------------</option>
	
		<%	Do until rsca.eof	%>
										<option value="<%=rsca("first_code")%>"
									<%	if int(Request.form("degree")) >= 2 then%>
										<%	if rsca("first_code")=request("first_code") then%>
											selected
										<%	end if	%>
									<% else %>
										<%	if rsca("first_code")=mid(rs("ad_category"),1,2) then%>
											selected
										<%	end if	%>
									<% end if %>
											><%=rsca("first_name")%></option>
		<%	rsca.movenext
			loop	%>
									</select>
	<%	end if	

			if int(Request.form("degree")) >= 2 then
				first_code=request("first_code")
			else
				first_code=mid(rs("ad_category"),1,2)
			end if

			sqlca2 = "SELECT * FROM nshop_second WHERE first_code = '"&first_code&"' AND second_code IN (SELECT second_code FROM nshop_third WHERE first_code = '"&first_code&"' AND third_qty <> 0 GROUP BY second_code HAVING COUNT(second_code) > 1)"
			set rsca2 = Conn.Execute(sqlca2)
		
			if rsca2.eof then
				if not request("first_code")="" then	%>
									마지막 카테고리입니다.
			<%	end if
			else	%>
						        	<select name="second_code" style="background:#Fdfcf4">
										<option value="">두번째 카테고리</option>
										<option value="">---------------</option>
										<option value=""<% if mid(rs("ad_category"),3,2)="" then%> selected<% end if %>>첫번째 카테고리에 광고등록</option>
			<%	Do until rsca2.eof	%>
										<option value="<%=rsca2("second_code")%>"
										<%	if rsca2("second_code")=mid(rs("ad_category"),3,2) then%>
											selected
										<%	end if	%>
											><%=rsca2("second_name")%></option>
			<%	rsca2.movenext
				loop
		end if	%>
									</select><br>
								</td>
							</tr>
							<tr>
								<td><font size=2>등록자</font></td>
								<td><input type=text name=writer  size=20 maxlength=10 class="form" value="<%=rs("writer")%>"><font color=darkred>&nbsp;등록하시는 분의 성함을 입력해주세요~~</a></td>
							</tr>
							<tr>
								<td><font size=2>이메일</font></td>
								<td><input type=text name=email  size=40 maxlength=70 class="form" value="<%=rs("email")%>"><font color=darkred>&nbsp;등록하시는 분의 이메일을 입력해주세요~~</a></td>
							</tr>
<%  if rs("tel")="" then
		tel1=""
		tel2=""
		tel3=""
	else
		tel=split(rs("tel"),"-")
		tel1=tel(0)
		tel2=tel(1)
		tel3=tel(2)
	end if	%>
							<tr>
								<td><font size=2>전화번호</font></td>
								<td><input type=text name=tel1 size=4 class="form" value="<%=tel1%>"> - <input type=text name=tel2 size=4 class="form" value="<%=tel2%>"> - <input type=text name=tel3 size=4 class="form" value="<%=tel3%>"><font color=darkred>&nbsp;등록하시는 분의 전화번호을 입력해주세요~~</a></td>
							</tr>
						    <tr>
						        <td valign=top><font size=2>내용</font></td>
						        <td><textarea name=content  rows=15 cols=75 maxlength=5000 class="form"><%=rs("content")%></textarea></td>
						    </tr>
							<tr>
								<td width=70><font size=2>메인페이지노출여부</font></td>
								<td>
									<select name=del class="form">
						                <option value="Y"<% if rs("del")="Y" then %> selected<% end if %>>보임</option>
										<option value="N"<% if rs("del")="N" then %> selected<% end if %>>보이지 않음</option>
									</select>
								</td>
							</tr>
						    <tr>
						        <td valign=top><font size=2>노출기간</font></td>
						        <td>
									<select name=start_y class="form">
					<% for n=2000 to 2002 %>
						                <option value="<%=n%>"<%if n=cint(left(rs("start_day"),4)) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=start_m class="form">
					<% for n=1 to 12 %>
						                <option value="<%=n%>"<%if n=cint(mid(rs("start_day"),6,2)) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=start_d class="form">
					<% for n=1 to 31 %>
						                <option value="<%=n%>"<%if n=cint(right(rs("start_day"),2)) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									&nbsp;~&nbsp;
									<select name=end_y class="form">
					<% for n=2000 to 2002 %>
						                <option value="<%=n%>"<%if n=cint(left(rs("end_day"),4)) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=end_m class="form">
					<% for n=1 to 12 %>
						                <option value="<%=n%>"<%if n=cint(mid(rs("end_day"),6,2)) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=end_d class="form">
					<% for n=1 to 31 %>
						                <option value="<%=n%>"<%if n=cint(right(rs("end_day"),2)) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
						        </td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center><input type=submit value="업체소식수정">&nbsp;&nbsp;&nbsp;
								<input type=reset  value=다시작성>&nbsp;&nbsp;&nbsp;
								<input type=button  value="업체목록" onclick="location.replace('nshop_ad_list.asp?page=<%=page%>&startpage=<%=startpage%>')"></td>
						    </tr>
					    </table>
					</td>
				</tr>
		    </table>
		</form>
<%	end if	%>
		</tr>
	</td>
</table>
</body>
</html>