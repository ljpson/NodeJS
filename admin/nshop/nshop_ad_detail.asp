<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT * from nshop_ad where idx="&request("idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>[NPOINT] 관리자툴 - 업체광고신청상세보기</title>
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
	.form2 {BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
	.font9 {  font-size: 10pt; font-family: "굴림체", "Verdana", "sans-serif"}
//-->
</style>
<SCRIPT LANGUAGE="JAVASCRIPT">
function del_chk()
{
	intReturn = confirm("업체을 정말로 삭제하시겠습니까?");
	
	if (intReturn) 
	{	
		location.replace('nshop_del_result.asp?nshop_code=<%=rs("nshop_code")%>&page=<%=page%>&startpage=<%=startpage%>');
	}
}
</script>
<body text="#222222" link="#004cb3" vlink="#b300a9" alink="#ca2204">
<table width=700 align=center>
	<tr>
		<td align=center>
			<table width=630 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>업체광고신청상세보기</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=630 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td width=5 rowspan=12></td>
								<td height=10 colspan=2></td>
								<td width=5 rowspan=12></td>
							</tr>
			<%	sqlca1="select first_name from nshop_first where first_code='"&mid(rs("ad_category"),1,2)&"'"
				set rsca1 = Conn.Execute(sqlca1)
				sqlca2="select second_name from nshop_second where second_code='"&mid(rs("ad_category"),3,2)&"'"
				set rsca2 = Conn.Execute(sqlca2)	%>
							<tr>
								<td width=70><font size=2>카테고리</font></td>
								<td style="padding:5px" class="form">
					<%	if not rsca1.eof then	%>
								<%=rsca1("first_name")%>
					<%	end if
						if not rsca2.eof then	%>
								 : <%=rsca2("second_name")%>
					<%	end if	%>
								</td>
							</tr>
							<tr>
								<td><font size=2>등록자</font></td>
								<td style="padding:5px" class="form"><%=rs("writer")%></td>
							</tr>
							<tr>
								<td><font size=2>이메일</font></td>
								<td style="padding:5px" class="form"><%=rs("email")%></td>
							</tr>
							<tr>
								<td><font size=2>전화번호</font></td>
								<td style="padding:5px" class="form"><%=rs("tel")%></td>
							</tr>
							<tr>
								<td><font size=2>내용</font></td>
								<td style="padding:5px" class="form2"><%=Replace(rs("content"),chr(13)&chr(10),"<br>")%></td>
							</tr>  

<%
	Select Case rs("del")
		Case "Y" del = "보임" 
		Case "N" del = "보이지 않음" 
	End Select
%>
							<tr>
								<td><font size=2>메인페이지노출여부</font></td>
								<td style="padding:5px" class="form"><%=del%></td>
							</tr>
							<tr>
								<td><font size=2>노출기간</font></td>
								<td style="padding:5px" class="form"><%=rs("start_day")%>&nbsp;~&nbsp;<%=rs("end_day")%></td>
							</tr>
						    <tr>
								<td style="padding:15px" colspan=2 align=center>
									<input type=button value="수정" onclick="location.replace('nshop_ad_edit.asp?idx=<%=rs("idx")%>&page=<%=page%>&startpage=<%=startpage%>')">&nbsp;&nbsp;&nbsp;
<!--									<input type=button  value="삭제" onclick="del_chk()">&nbsp;&nbsp;&nbsp;-->
									<input type=button  value="업체광고목록" onclick="location.replace('nshop_ad_list.asp?page=<%=page%>&startpage=<%=startpage%>')"></td>
						    </tr>
					    </table>
					</td>
				</tr>
		    </table>
		</tr>
	</td>
</table>
</body>
</html>