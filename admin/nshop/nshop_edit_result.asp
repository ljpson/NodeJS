<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  
			
	nshop_code=request("nshop_code")
	tel=request("tel1")&"-"&request("tel2")&"-"&request("tel3")
	if not(request("fax1")="" and request("fax2")="" and request("fax3")="") then
		fax=request("fax1")&"-"&request("fax2")&"-"&request("fax3")
	end if
	if not(request("zip1")="" and request("zip2")="") then
		zip=request("zip1")&"-"&request("zip2")
	end if
	if not(request("captain1_tel1")="" and request("captain1_tel2")="" and request("captain1_tel3")="") then
		captain1_tel=request("captain1_tel1")&"-"&request("captain1_tel2")&"-"&request("captain1_tel3")
	end if
	if not(request("captain2_tel1")="" and request("captain2_tel2")="" and request("captain2_tel3")="") then
		captain2_tel=request("captain2_tel1")&"-"&request("captain2_tel2")&"-"&request("captain2_tel3")
	end if
	if not(request("captain3_tel1")="" and request("captain3_tel2")="" and request("captain3_tel3")="") then
		captain3_tel=request("captain3_tel1")&"-"&request("captain3_tel2")&"-"&request("captain3_tel3")
	end if
	
	Ins="update nshop_info set nshop_code='"&nshop_code&"',nshop_kname='"&request("nshop_kname")&"',nshop_ename='"&request("nshop_ename")&_
		"',S_content='"&request("S_content")&"',L_content='"&request("L_content")&"',url='"&request("url")&"',email='"&request("email")&_
		"',tel='"&tel&"',fax='"&fax&"',zip='"&zip&"',addr1='"&request("addr1")&"',addr2='"&request("addr2")&"',nshop='"&request("nshop")&_
		"',module='"&request("module")&"',captain1_name='"&request("captain1_name")&"',captain1_email='"&request("captain1_email")&_
		"',captain1_tel='"&captain1_tel&"',captain2_name='"&request("captain2_name")&"',captain2_email='"&request("captain2_email")&_
		"',captain2_tel='"&captain2_tel&"',captain3_name='"&request("captain3_name")&"',captain3_email='"&request("captain3_email")&_
		"',captain3_tel='"&captain3_tel&"' where nshop_code='"&nshop_code&"'"
	Conn.Execute(Ins)

%>

<HTML>
<HEAD>
<TITLE>[NSHOP] 관리자툴 - 업체(NSHOP)정보 수정</TITLE>
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
							<td><INPUT type="button" value="메인화면" class=form style="CURSOR: hand" onclick="location.replace('../default.asp');" id=submit1 name=submit1></td>
							<td><INPUT type="button" value="이전화면으로" class=form style="CURSOR: hand" onclick="javascript:history.back(-1);" id=submit2 name=submit2></td>
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