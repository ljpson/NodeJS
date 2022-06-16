<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  
			
	idx=request("idx")

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
	
	Ins="update nshop_news set writer='"&request("writer")&"',subject='"&_
		request("subject")&"',content='"&request("content")&"',kind='"&request("kind")&"',start_day='"&_
		start_day&"',end_day='"&end_day&"',regdate=getdate(),del='"&request("del")&"' where idx='"&idx&"'"
	Conn.Execute(Ins)

%>

<HTML>
<HEAD>
<TITLE>[NSHOP] 관리자툴 - 공지사항/이벤트 수정</TITLE>
</HEAD>
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
<BR>
<BR>
<table width=700 cellpadding=0 cellspacing=0 border=0 align=center>
	<tr>
		<td align=center height=400>
		<table width=500 cellpadding=5 cellspacing=3 bgcolor="#EEEECC">
			<tr>
				<td align=center height=200 valign=middle class="font9" colspan=2>
					정상적으로 수정되었습니다!! <BR>
					업체정보 목록에서 확인하시고,<br> 잘못 기입된 부분이 있으면 수정해 주세요!!
					<br><br>
					<table align=center>
						<tr>
							<td><INPUT type="button" value="메인화면" class=form style="CURSOR: hand" onclick="location.replace('../default.asp');"></td>
							<td><INPUT type="button" value="이전화면으로" class=form style="CURSOR: hand" onclick="javascript:history.back(-1);"></td>
							<td><input type=button  value="업체목록" class=form style="CURSOR: hand" onclick="location.replace('nshop_news_list.asp?page=<%=page%>&startpage=<%=startpage%>');"></td>
						</tr>
					</table>
				</td>
			</tr>		
		</table>
		</td>
	</tr>
</table></div>
</BODY>
</HTML>
<% Conn.Close %>