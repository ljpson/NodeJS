
<html>
<head><title>[NSHOP] �������� - ��������/�̺�Ʈ ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
	if (document.reg.writer.value == "" ) {	alert("����ڸ� �Է��Ͻʽÿ� "); document.reg.writer.focus(); return false; }
	if (document.reg.subject.value == "" ) {	alert("������ �Է��Ͻʽÿ� "); document.reg.subject.focus(); return false; }
	if (document.reg.subject.value.length > 35 ) {	alert("������ �ʹ� ��� �Է��� �� �����ϴ� "); document.reg.subject.focus(); return false; }
	if (document.reg.content.value.length < 50 ) { alert(" ��ü�ҽ��� �ڼ��� �Է��Ͻʽÿ� "); document.reg.content.select(); return false; }
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
<form action=nshop_news_input_result.asp method=post  name="reg"   onSubmit="return check_len(this)">
<table width=700 align=center>
	<tr>
		<td align=center>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>��������/�̺�Ʈ ���</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td width=15 rowspan=14></td>
								<td height=10 colspan=4></td>
							</tr>  
							<tr>
								<td><font size=2>�����</font></td>
								<td colspan=3><input type=text name=writer  size=20 maxlength=10 class="form"><font color=darkred>&nbsp;����Ͻô� ���� ������ �Է����ּ���~~</a></td>
							</tr>
							<tr>
								<td><font size=2>����</font></td>
								<td colspan=3><input type=text name=subject  size=50 maxlength=70 class="form"></td>
							</tr>
						    <tr>
						        <td valign=top><font size=2>����</font></td>
						        <td colspan=3><textarea name=content  rows=15 cols=75 maxlength=5000 class="form">�ѱ� 4000�� �̳�</textarea></td>
						    </tr>
							<tr>
								<td width=65><font size=2>������</font></td>
								<td width=200>
									<select name=kind class="form">
						                <option value="1">��������</option>
										<option value="2">�̺�Ʈ</option>
									</select>
								</td>
								<td width=130><font size=2>�������������⿩��</font></td>
								<td width=190>
									<select name=del class="form">
						                <option value="Y">����</option>
										<option value="N" selected>������ ����</option>
									</select>
								</td>
							</tr>
						    <tr>
						        <td valign=top><font size=2>����Ⱓ</font></td>
						        <td colspan=3>
									<select name=start_y class="form">
					<% for n=2000 to 2002 %>
						                <option value="<%=n%>"<%if n=year(date) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=start_m class="form">
					<% for n=1 to 12 %>
						                <option value="<%=n%>"<%if n=month(date) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=start_d class="form">
					<% for n=1 to 31 %>
						                <option value="<%=n%>"<%if n=day(date) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									&nbsp;~&nbsp;
									<select name=end_y class="form">
					<% for n=2000 to 2002 %>
						                <option value="<%=n%>"<%if n=year(date) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=end_m class="form">
					<% for n=1 to 12 %>
						                <option value="<%=n%>"<%if n=month(date) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
									-
									<select name=end_d class="form">
					<% for n=1 to 31 %>
						                <option value="<%=n%>"<%if n=day(date) then%> selected<%end if%>><%=n%></option>
					<% next %>
									</select>
						        </td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center><input type=submit value="��ü�ҽ� �Է�">&nbsp;&nbsp;&nbsp;
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