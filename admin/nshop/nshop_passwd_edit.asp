<%
set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT nshop_code,nshop_passwd from nshop_info where nshop_idx="&request("nshop_idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>[NPOINT] �������� - ��ü(NSHOP)��й�ȣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{

	if (document.reg.nshop_passwd1.value == "" ) {	alert("������ ��й�ȣ�� �Է��Ͻʽÿ� "); document.reg.nshop_passwd1.focus(); return false; }
	if (document.reg.nshop_passwd1.value != "<%=rs("nshop_passwd")%>" ) {	alert("��й�ȣ�� �ٸ��ϴ�. �ٽ� �Է��Ͻʽÿ� "); document.reg.nshop_passwd1.focus(); return false; }
	if (document.reg.nshop_passwd2.value == "" ) {	alert("������ ��й�ȣ�� �Է��Ͻʽÿ� "); document.reg.nshop_passwd2.focus(); return false; }
	if (document.reg.nshop_passwd3.value == "" ) {	alert("������ ��й�ȣ�� �ѹ� �� �Է��Ͻʽÿ� "); document.reg.nshop_passwd3.focus(); return false; }
	if (document.reg.nshop_passwd2.value != document.reg.nshop_passwd3.value ) {	alert("�Է��Ͻ� ��й�ȣ�� �ٸ��ϴ�. ������ ��й�ȣ�� �Ȱ��� �ѹ� �� �Է��ϼž� �մϴ� "); document.reg.nshop_passwd3.focus(); return false; }

	document.reg.submit();document.reg.url.value.indexOf('http://')==-1
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
<form action=nshop_passwd_edit_result.asp method=post  name="reg"  >
<table width=500 align=center>
	<tr>
		<td align=center>
			<table width=300 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>��ü(NSHOP)��й�ȣ����</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=300 cellpadding=1 cellspacing=3 bgcolor="#EEEECC" border=0>
							<tr>
								<td width=5 rowspan=15></td>
								<td height=10 colspan=2></td>
								<td width=5 rowspan=15></td>
							</tr>  
							<tr>
								<td style="padding:5px"><font size=2>��ü�ڵ�</font></td>
								<td>
									<input type=text name=nshop_code  size=22 maxlength=50 class="form" value="<%=rs("nshop_code")%>" disabled>
									<input type=hidden name=nshop_code  size=22 maxlength=50 class="form" value="<%=rs("nshop_code")%>">
								</td>
							</tr>
							<tr>
								<td width=120 style="padding:5px"><font size=2>�� ��й�ȣ</font></td>
								<td width=170><input type=text name=nshop_passwd1  size=22 maxlength=50 class="form"></td>
							</tr>   
							<tr>
								<td width=120 style="padding:5px"><font size=2>�� ��й�ȣ</font></td>
								<td width=170><input type=text name=nshop_passwd2  size=22 maxlength=50 class="form"></td>
							</tr>
							<tr>
								<td width=120 style="padding:5px"><font size=2>��й�ȣȮ��</font></td>
								<td width=170><input type=text name=nshop_passwd3  size=22 maxlength=50 class="form"></td>
							</tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center><input type=button value="��ü���� ����" onclick="return check_len(this)">&nbsp;&nbsp;&nbsp;
								<input type=reset  value=�ٽ��ۼ�></td>
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