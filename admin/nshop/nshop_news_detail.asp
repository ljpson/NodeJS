<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT * from nshop_news where idx="&request("idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>[NSHOP] �������� - ��������/�̺�Ʈ �󼼺���</title>
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
<SCRIPT LANGUAGE="JAVASCRIPT">
function del_chk()
{
	intReturn = confirm("��ü�� ������ �����Ͻðڽ��ϱ�?");
	
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
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>��������/�̺�Ʈ �󼼺���</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td width=10 rowspan=12></td>
								<td height=10 colspan=4></td>
								<td width=10 rowspan=12></td>
							</tr>
							<tr>
								<td><font size=2>�����</font></td>
								<td style="padding:5px" width=180 class="form" colspan=3><%=rs("writer")%></td>
							</tr>
							<tr>
								<td><font size=2>����</font></td>
								<td style="padding:5px" class="inkform" colspan=3><%=rs("subject")%></td>
							</tr>
							<tr>
								<td><font size=2>����</font></td>
								<td style="padding:5px" class="form" colspan=3><%=Replace(rs("content"),chr(13)&chr(10),"<br>")%></td>
							</tr>  

<%
	Select Case rs("kind")
		Case "1" kind = "��������" 
		Case "2" kind = "�̺�Ʈ" 
	End Select

	Select Case rs("del")
		Case "Y" del = "����" 
		Case "N" del = "������ ����" 
	End Select
%>
							<tr>
								<td width=80><font size=2>������</font></td>
								<td width=180 style="padding:5px" class="form"><%=kind%></td>
								<td width=140><font size=2>�������������⿩��</font></td>
								<td width=180 style="padding:5px" class="form"><%=del%></td>
							</tr>
							<tr>
								<td><font size=2>����Ⱓ</font></td>
								<td style="padding:5px" class="form" colspan=3><%=rs("start_day")%>&nbsp;~&nbsp;<%=rs("end_day")%></td>
							</tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center>
									<input type=button value="����" onclick="location.replace('nshop_news_edit.asp?idx=<%=rs("idx")%>&page=<%=page%>&startpage=<%=startpage%>')">&nbsp;&nbsp;&nbsp;
<!--									<input type=button  value="����" onclick="del_chk()">&nbsp;&nbsp;&nbsp;-->
									<input type=button  value="��ü���" onclick="location.replace('nshop_news_list.asp?page=<%=page%>&startpage=<%=startpage%>')"></td>
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