<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT * from nshop_info where nshop_idx="&request("nshop_idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>[NPOINT] 관리자툴 - 업체(NSHOP)정보수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
//업체명
	var cust_name=document.reg.nshop_kname.value;
	if(cust_name==""){ alert('업체명(한글)을 입력하십시오.');document.reg.nshop_kname.focus();return false;	}
	else	{
		for(var i=0;i<cust_name.length;i++){
			if((cust_name.charAt(i) >= '0' && cust_name.charAt(i) <= '9') || (cust_name.charAt(i) >= 'A' && cust_name.charAt(i) <= 'Z') || (cust_name.charAt(i) >= 'a' && cust_name.charAt(i) <= 'z')){
				alert('이름은 반드시 한글로 입력하십시오.');
				document.reg.nshop_kname.focus();
				document.reg.nshop_kname.select();
				return false;
			}
		}
	}
	if (document.reg.nshop_ename.value == "" ) {	alert("업체명(영문)을 입력하십시오 "); document.reg.nshop_ename.focus(); return false; }
//URL
	if (document.reg.url.value == "" ) {	alert("URL을 입력하십시오 "); document.reg.url.focus(); return false; }
	if(document.reg.url.value!="" && document.reg.url.value.indexOf('http://')==-1) { alert("http://를 포합해서 기입하셔야 합니다.");document.reg.url.focus();return false; }
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
// 팩스번호
	var fax1=document.reg.fax1.value;
	var ichk=0;
	for (var i=0;i<fax1.length;i++) {
		var ch1 = fax1.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("팩스번호를 숫자로 입력하십시오 "); document.reg.fax1.focus(); return false; }

	var fax2=document.reg.fax2.value;
	var ichk=0;
	for (var i=0;i<fax2.length;i++) {
		var ch1 = fax2.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("팩스번호를 숫자로 입력하십시오 "); document.reg.fax2.focus(); return false; }

	var fax3=document.reg.fax3.value;
	var ichk=0;
	for (var i=0;i<fax3.length;i++) {
		var ch1 = fax3.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("팩스번호를 숫자로 입력하십시오 "); document.reg.fax3.focus(); return false; }
// 우편번호
	var zip1=document.reg.zip1.value;
	var ichk=0;
	for (var i=0;i<zip1.length;i++) {
		var ch1 = zip1.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("우편번호를 숫자로 입력하십시오 "); document.reg.zip1.focus(); return false; }

	var zip2=document.reg.zip2.value;
	var ichk=0;
	for (var i=0;i<zip2.length;i++) {
		var ch1 = zip2.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("우편번호를 숫자로 입력하십시오 "); document.reg.zip2.focus(); return false; }

// 업체설명
	if (document.reg.S_content.value.length < 12 ) { alert(" 업체설명을 자세히 입력하십시오 "); document.reg.S_content.select(); return false; }
	if (document.reg.L_content.value.length < 50 ) { alert(" 업체품설명을 자세히 입력하십시오 "); document.reg.L_content.select(); return false; }

//담당자
	if (document.reg.captain1_name.value == "" ) {	alert("업체담당자를 입력하십시오 "); document.reg.captain1_name.focus(); return false; }
	if (document.reg.captain2_name.value == "" ) {	alert("업체담당자를 입력하십시오 "); document.reg.captain2_name.focus(); return false; }
	if (document.reg.captain3_name.value == "" ) {	alert("업체담당자를 입력하십시오 "); document.reg.captain3_name.focus(); return false; }

}
//우편번호 창띄우기
function makeWindow_haddr() {
	var hoptions="toolbar=no,width=500,height=400,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,left=0,top=0"
	RWin = window.open('nshop_zipcode.asp','opts',hoptions);
	if (RWin !=null) {
		RWin.opener=self;
	}
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
<form action=nshop_edit_result.asp method=post  name="reg"   onSubmit="return check_len(this)">
<table width=700 align=center>
	<tr>
		<td align=center>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>업체(NSHOP)정보수정</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC" border=0>
							<tr>
								<td width=5 rowspan=15></td>
								<td height=10 colspan=4></td>
								<td width=5 rowspan=15></td>
							</tr>  
							<tr>
								<td style="padding:5px"><font size=2>업체코드</font></td>
								<td colspan=3>
									<input type=text name=nshop_code  size=22 maxlength=50 class="form" value="<%=rs("nshop_code")%>" disabled>
									<input type=hidden name=nshop_code  size=22 maxlength=50 class="form" value="<%=rs("nshop_code")%>">
									<input type=hidden name=page  size=22 maxlength=50 class="form" value="<%=page%>">
									<input type=hidden name=startpage  size=22 maxlength=50 class="form" value="<%=startpage%>">
								</td>
							</tr>
							<tr>
								<td width=126 style="padding:5px"><font size=2>업체명(한글)</font></td>
								<td width=185><input type=text name=nshop_kname  size=22 maxlength=50 class="form" value="<%=rs("nshop_kname")%>"></td>
								<td width=90 style="padding:5px"><font size=2>업체명(영문)</font></td>
								<td width=189><input type=text name=nshop_ename  size=22 maxlength=50 class="form" value="<%=rs("nshop_ename")%>"></td>
							</tr>   
<%  if rs("url")="" then
		url="http://"
	else
		url=rs("url")
	end if %>
							<tr>
								<td style="padding:5px"><font size=2>URL</font></td>
								<td colspan=3><input type=text name=url size=50 maxlength=50 class="form" value="<%=url%>"></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>대표이메일</font></td>
								<td colspan=3><input type=text name=email size=50 maxlength=50 class="form" value="<%=rs("email")%>"></td>
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
	end if 

	if rs("fax")="" then
		fax1=""
		fax2=""
		fax3=""
	else
		fax=split(rs("fax"),"-")
		fax1=fax(0)
		fax2=fax(1)
		fax3=fax(2)
	end if %>
							<tr>
								<td style="padding:5px"><font size=2>대표전화</font></td>
								<td><input type=text name=tel1 size=4 class="form" value="<%=tel1%>"> - <input type=text name=tel2 size=4 class="form" value="<%=tel2%>"> - <input type=text name=tel3 size=4 class="form" value="<%=tel3%>"></td>
								<td><font size=2>팩스</font></td>
								<td><input type=text name=fax1 size=4 class="form" value="<%=fax1%>"> - <input type=text name=fax2 size=4 class="form" value="<%=fax2%>"> - <input type=text name=fax3 size=4 class="form" value="<%=fax3%>"></td>
							</tr>
<%	if rs("zip")=""  then
		zip1=""
		zip2=""
	else
		zip=split(rs("zip"),"-")
		zip1=zip(0)
		zip2=zip(1)
	end if %>
							<tr>
								<td style="padding:5px"><font size=2>주소</font></td>
								<td colspan=3>
									<input type=text name=addr1_d  size=20 maxlength=50 class="form" value="<%=rs("addr1")%>" disabled> <input type=text name=addr2  size=23 maxlength=50 class="form" value="<%=rs("addr2")%>"> 
									( <input type=text name=zip1_d size=3 class="form" value="<%=zip1%>" disabled> - <input type=text name=zip2_d size=3 class="form" value="<%=zip2%>" disabled> )
									<input type=button value="주소찾기" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; height:18px; BORDER:1x solid #778899" onClick="makeWindow_haddr()"></td>
									<input type=hidden name=addr1  size=20 maxlength=50 class="form" value="<%=rs("addr1")%>">
									<input type=hidden name=zip1 size=3 class="form" value="<%=zip1%>">
									<input type=hidden name=zip2 size=3 class="form" value="<%=zip2%>">
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>모듈설치</font></td>
								<td>
									<select name=module class="form">
						                <option value="N"<%if rs("module")="N" then%> selected<%end if%>>설치안됨</option>
										<option value="Y"<%if rs("module")="Y" then%> selected<%end if%>>설치됨</option>
									</select>
								</td>
								<td><font size=2>NSHOP여부</font></td>
								<td>
									<select name=nshop class="form">
						                <option value="N"<%if rs("nshop")="N" then%> selected<%end if%>>NO NSHOP</option>
										<option value="Y"<%if rs("nshop")="Y" then%> selected<%end if%>>NSHOP</option>
									</select>
								</td>
							</tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>업체설명<br>(간단히)</font></td>
						        <td colspan=3><textarea name=S_content  rows=2 cols=70 maxlength=255 class="form"><%=rs("S_content")%></textarea></td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>업체설명<br>(자세히)</font></td>
						        <td colspan=3><textarea name=L_content  rows=15 cols=70 maxlength=5000 class="form"><%=rs("L_content")%></textarea></td>
						    </tr>
<% 
	if rs("captain1_tel")="" then
		captain1_tel1=""
		captain1_tel2=""
		captain1_tel3=""
	else
		captain1_tel=split(rs("captain1_tel"),"-")
		captain1_tel1=captain1_tel(0)
		captain1_tel2=captain1_tel(1)
		captain1_tel3=captain1_tel(2)
	end if
	if rs("captain2_tel")="" then
		captain2_tel1=""
		captain2_tel2=""
		captain2_tel3=""
	else
		captain2_tel=split(rs("captain2_tel"),"-")
		captain2_tel1=captain2_tel(0)
		captain2_tel2=captain2_tel(1)
		captain2_tel3=captain2_tel(2)
	end if
	if rs("captain3_tel")="" then
		captain3_tel1=""
		captain3_tel2=""
		captain3_tel3=""
	else
		captain3_tel=split(rs("captain3_tel"),"-")
		captain3_tel1=captain3_tel(0)
		captain3_tel2=captain3_tel(1)
		captain3_tel3=captain3_tel(2)
	end if
%>
						    <tr>
						        <td style="padding:5px" align=center><b>업체담당자</b></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td width=95 align=center><b>이름</b></td>
											<td width=145 align=center><b>전화번호</b></td>
											<td width=200 align=center><b>이메일</b></td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>제휴(마케팅)팀장</font></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td width=95><input type=text name=captain1_name  size=12 maxlength=50 class="form" value="<%=rs("captain1_name")%>"></td>
											<td width=145><input type=text name=captain1_tel1 size=4 class="form" value="<%=captain1_tel1%>"> - <input type=text name=captain1_tel2 size=4 class="form" value="<%=captain1_tel2%>"> - <input type=text name=captain1_tel3 size=4 class="form" value="<%=captain1_tel3%>"></td>
											<td width=200><input type=text name=captain1_email  size=30 maxlength=50 class="form" value="<%=rs("captain1_email")%>"></td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>사이트운영팀장</font></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td width=95><input type=text name=captain2_name  size=12 maxlength=50 class="form" value="<%=rs("captain2_name")%>"></td>
											<td width=145><input type=text name=captain2_tel1 size=4 class="form" value="<%=captain2_tel1%>"> - <input type=text name=captain2_tel2 size=4 class="form" value="<%=captain2_tel2%>"> - <input type=text name=captain2_tel3 size=4 class="form" value="<%=captain2_tel3%>"></td>
											<td width=200><input type=text name=captain2_email  size=30 maxlength=50 class="form" value="<%=rs("captain2_email")%>"></td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>기술팀장</font></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td width=95><input type=text name=captain3_name  size=12 maxlength=50 class="form" value="<%=rs("captain3_name")%>"></td>
											<td width=145><input type=text name=captain3_tel1 size=4 class="form" value="<%=captain3_tel1%>"> - <input type=text name=captain3_tel2 size=4 class="form" value="<%=captain3_tel2%>"> - <input type=text name=captain3_tel3 size=4 class="form" value="<%=captain3_tel3%>"></td>
											<td width=200><input type=text name=captain3_email  size=30 maxlength=50 class="form" value="<%=rs("captain3_email")%>"></td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center><input type=submit value="업체정보 수정">&nbsp;&nbsp;&nbsp;
								<input type=reset  value=다시작성></td>
						    </tr>
					    </table>
					</td>
				</tr>
		    </table>
		</tr>
	</td>
</table>
</form>
</body>
</html>