<%

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  
			
	nshop_code=request("nshop_code")
	nshop_passwd=request("nshop_passwd2")
	
	Ins="update nshop_info set nshop_passwd='"&nshop_passwd&"' where nshop_code='"&nshop_code&"'"
	Conn.Execute(Ins)

%>

<HTML>
<HEAD>
<TITLE>[NSHOP] �������� - ��ü(NSHOP)��й�ȣ����</TITLE>
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
	.form {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
	.font9 {  font-size: 10pt; font-family: "����ü", "Verdana", "sans-serif"}
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
					���������� �����Ǿ����ϴ�!! <BR>
					���ιٲ� ��й�ȣ�� �� ����Ͻð�,<br>
					���� �α��κ��� �� ��й�ȣ�� ������ּ���!!<br><br>
					<table align=center>
						<tr>
							<td><INPUT type="button" value="����ȭ��" class=form style="CURSOR: hand" onclick="location.replace('../default.asp');" id=submit1 name=submit1></td>
							<td><INPUT type="button" value="����ȭ������" class=form style="CURSOR: hand" onclick="javascript:history.back(-1);" id=submit2 name=submit2></td>
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