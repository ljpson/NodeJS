<%	set Conn=Server.CreateObject ("adodb.Connection")
	Conn.Open "7npoint","sa","Ekdelsl"	%>
<html>
<head><title>[NPOINT] �������� - ��ü�����û</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
	if (document.reg.nshop_code.value == "" ) {	alert("��ü�ڵ��� �Է��Ͻʽÿ� "); document.reg.nshop_code.focus(); return false; }
	if (document.reg.first_code.value == "" ) {	alert("���� ������ ī�װ��� �Է��Ͻʽÿ� "); document.reg.first_code.focus(); return false; }
	if (document.reg.writer.value == "" ) {	alert("����ڸ� �Է��Ͻʽÿ� "); document.reg.writer.focus(); return false; }
	if (document.reg.email.value == "" ) {	alert("�̸����� �Է��Ͻʽÿ� "); document.reg.email.focus(); return false; }
	if (document.reg.content.value == "" ) { alert(" ��ü�ҽ��� �ڼ��� �Է��Ͻʽÿ� "); document.reg.content.select(); return false; }
// ��ȭ��ȣ
	if (document.reg.tel1.value == "" ) {	alert("������ȣ�� �Է��Ͻʽÿ� "); document.reg.tel1.focus(); return false; }
	var tel1=document.reg.tel1.value;
	var ichk=0;
	for (var i=0;i<tel1.length;i++) {
		var ch1 = tel1.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("������ȣ�� ���ڷ� �Է��Ͻʽÿ� "); document.reg.tel1.focus(); return false; }

	if (document.reg.tel2.value == "" ) {	alert("��ȭ��ȣ�� �Է��Ͻʽÿ� "); document.reg.tel2.focus(); return false; }
	var tel2=document.reg.tel2.value;
	var ichk=0;
	for (var i=0;i<tel2.length;i++) {
		var ch1 = tel2.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("��ȭ��ȣ�� ���ڷ� �Է��Ͻʽÿ� "); document.reg.tel2.focus(); return false; }
	
	if (document.reg.tel3.value == "" ) {	alert("��ȭ��ȣ�� �Է��Ͻʽÿ� "); document.reg.tel3.focus(); return false; }
	var tel3=document.reg.tel3.value;
	var ichk=0;
	for (var i=0;i<tel3.length;i++) {
		var ch1 = tel3.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("��ȭ��ȣ�� ���ڷ� �Է��Ͻʽÿ� "); document.reg.tel3.focus(); return false; }
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
	.form {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
	.font9 {  font-size: 10pt; font-family: "����ü", "Verdana", "sans-serif"}
//-->
</style>
<body text="#222222" link="#004cb3" vlink="#b300a9" alink="#ca2204">
<table width=700 cellpadding=0 cellspacing=0 border=0 align=center>
	<tr>
		<td align=center valign=middle height=400>
<% if session("nshop_id")="" then %>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>��ü�����û</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td height=150 align=center>
									��ڴ��� �ڸ��� ���� �ð��� �����Ǿ�<br>
									���Ȼ� �����ڸ�带 ������׽��ϴ�.<br>
									�ٽ� �α��� �Ͻð�, ����� �ּ���!!<br><br><br>
									<input type=button value="�����ڸ���" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; height:18px; BORDER:1x solid #778899" onClick="location.replace('../default.asp')" id=button5 name=button5>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
<% else %>
	<%	if int(Request.form("degree")) >= 5 then

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
		
		Ins="insert into nshop_ad(nshop_code,ad_category,writer,email,tel,start_day,end_day,regdate,del,content) values('"&_
			nshop_code&"','"&ad_category&"','"&request("writer")&"','"&request("email")&"','"&tel&"','"&_
			start_day&"','"&end_day&"',getdate(),'N','"&request("content")&"')"
		Conn.Execute(Ins)	%>
		<table width=500 cellpadding=5 cellspacing=3 bgcolor="#EEEECC">
			<tr>
				<td align=center height=200 valign=middle class="font9" colspan=2>
					���������� �ԷµǾ����ϴ�!! <BR>
					��ü���� ��û��Ͽ��� Ȯ���Ͻð�,<br> �߸� ���Ե� �κ��� ������ ������ �ּ���!!
					<br><br>
					<table align=center>
						<tr>
							<td><INPUT type="button" value="����ȭ��" class=form style="CURSOR: hand" onclick="location.replace('../npoint_admin.asp');"></td>
							<td><input type=button  value="��ü�����û���" class=form style="CURSOR: hand" onclick="location.replace('nshop_ad_list.asp');"></td>
						</tr>
					</table>
				</td>
			</tr>		
		</table>
	<%	else	%>
		<form action=nshop_ad_input.asp method=post  name="reg" onSubmit="return check_len(this)">
			<INPUT TYPE="hidden" name="degree" value="">
			<INPUT TYPE="hidden" name="nshop_code" value="<%=session("nshop_id")%>">
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>��ü�����û</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td width=15 rowspan=14></td>
								<td height=10 colspan=4></td>
							</tr>  
							<tr>
								<td><font size=2>ī�װ�</font></td>
								<td valign=bottom align=left colspan=3>
		<%	sqlca = "SELECT * FROM nshop_first WHERE first_code IN (SELECT first_code FROM nshop_second WHERE second_qty <> 0 GROUP BY first_code HAVING COUNT(first_code) > 1)"
			set rsca = Conn.Execute(sqlca)
			
			if rsca.eof then	%>
									���� ������ �� �ִ� ī�װ��� ���� �غ���� �ʾҽ��ϴ�.
		<%	else	%>
						        	<select name="first_code" style="background:#Fdfcf4" onchange="javascript:fncsubmit(document.reg,2)">
										<option value="">ù��° ī�װ�</option>
										<option value="">---------------</option>
	
			<%	Do until rsca.eof	%>
										<option value="<%=rsca("first_code")%>"
										<%	if rsca("first_code")=request("first_code") then%>
											selected
										<%	end if	%>
											><%=rsca("first_name")%></option>
			<%	rsca.movenext
				loop	%>
									</select>
		<%	end if	

			if int(Request.form("degree")) >= 2 then

				sqlca2 = "SELECT * FROM nshop_second WHERE first_code = '"&request("first_code")&"' AND second_code IN (SELECT second_code FROM nshop_third WHERE first_code = '"&request("first_code")&"' AND third_qty <> 0 GROUP BY second_code HAVING COUNT(second_code) > 1)"
				set rsca2 = Conn.Execute(sqlca2)
			
				if rsca2.eof then
					if not request("first_code")="" then	%>
									������ ī�װ��Դϴ�.
				<%	end if
				else	%>
						        	<select name="second_code" style="background:#Fdfcf4">
										<option value="">�ι�° ī�װ�</option>
										<option value="">---------------</option>
										<option value="">ù��° ī�װ��� ���</option>
				<%	Do until rsca2.eof	%>
										<option value="<%=rsca2("second_code")%>"
										<%	if rsca2("second_code")=request("second_code") then%>
											selected
										<%	end if	%>
											><%=rsca2("second_name")%></option>
				<%	rsca2.movenext
					loop
				end if
			end if	%>
									</select><br>
								</td>
							</tr>
							<tr>
								<td><font size=2>�����</font></td>
								<td><input type=text name=writer size=20 maxlength=10 class="form" value="<%=request("writer")%>"><font color=darkred>&nbsp;����Ͻô� ���� ������ �Է����ּ���~~</font></a></td>
							</tr>
							<tr>
								<td><font size=2>�̸���</font></td>
								<td><input type=text name=email size=40 maxlength=70 class="form" value="<%=request("email")%>"><font color=darkred>&nbsp;����Ͻô� ���� �̸����� �Է����ּ���~~</font></a></td>
							</tr>
							<tr>
								<td><font size=2>��ȭ��ȣ</font></td>
								<td><input type=text name=tel1 size=4 class="form" value="<%=request("tel1")%>"> - <input type=text name=tel2 size=4 class="form" value="<%=request("tel2")%>"> - <input type=text name=tel3 size=4 class="form" value="<%=request("tel3")%>"><font color=darkred>&nbsp;����Ͻô� ���� ��ȭ��ȣ�� �Է����ּ���~~</font></a></td>
							</tr>
						    <tr>
						        <td valign=top><font size=2>����</font></td>
						        <td><textarea name=content  rows=15 cols=75 maxlength=5000 class="form">
<% if request("content")="" then %>
���� �� ������ ������� 510X130�Դϴ�.

500X130�� ���̺�ȿ� ǥ���Ͻ� ���� �ڵ��ϼż�,
HTML������ �� ���� �Է��� �ּ���!!

�̹��� ��ũ�� ������ ���� �����θ� �����ּ���!!

��>
<TABLE width=510 height=130 cellpadding=0 cellspacing=0><TR><TD><IMG SRC="http://www.npoint.co.kr/npoint/surfing_new/main/images/ad_test.gif" width=510 height=130></TD></TR></TABLE>
<% else %>
<%=request("content")%>
<% end if%>
									</textarea>
								</td>
						    </tr>
						    <tr>
						        <td valign=top><font size=2>����Ⱓ</font></td>
						        <td>
									<select name=start_y class="form">
					<% for n=2000 to 2002 %>
						                <option value="<%=n%>"<% if n=cint(request("start_y")) then%> selected<%else%><%if n=year(date) then%> selected<%end if%><%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=start_m class="form">
					<% for n=1 to 12 %>
						                <option value="<%=n%>"<% if n=cint(request("start_m")) then%> selected<%else%><%if n=month(date) then%> selected<%end if%><%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=start_d class="form">
					<% for n=1 to 31 %>
						                <option value="<%=n%>"<% if n=cint(request("start_d")) then%> selected<%else%><%if n=day(date) then%> selected<%end if%><%end if%>><%=n%></option>
					<% next %>
									</select>
									&nbsp;~&nbsp;
									<select name=end_y class="form">
					<% for n=2000 to 2002 %>
						                <option value="<%=n%>"<% if n=cint(request("end_y")) then%> selected<%else%><%if n=year(date) then%> selected<%end if%><%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=end_m class="form">
					<% for n=1 to 12 %>
						                <option value="<%=n%>"<% if n=cint(request("end_m")) then%> selected<%else%><%if n=month(date) then%> selected<%end if%><%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=end_d class="form">
					<% for n=1 to 31 %>
						                <option value="<%=n%>"<% if n=cint(request("end_d")) then%> selected<%else%><%if n=day(date) then%> selected<%end if%><%end if%>><%=n%></option>
					<% next %>
									</select>
						        </td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center><input type=submit value="��ü���� �Է�">&nbsp;&nbsp;&nbsp;
								<input type=reset  value=�ٽ��ۼ�></td>
						    </tr>
					    </table>
					</td>
				</tr>
		    </table>
		</form>
	<%	end if	%>
<%	end if	%>
		</tr>
	</td>
</table>
</body>
</html>