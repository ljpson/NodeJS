<html>
<head><title>[NSHOP] �������� - ��ü(NSHOP)���� �󼼺���</title>
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
<table width=700 align=center>
	<tr>
		<td align=center>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>��ü(NSHOP)���� �󼼺���</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
<% if session("nshop_id")="" then %>
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
<% else %>
<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT * from nshop_info where nshop_code='"&session("nshop_id")&"'"
	Set rs=Conn.Execute(Sel)
%>
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td height=10 colspan=4></td>
								<td width=5 rowspan=12></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>��ü�ڵ�</font></td>
								<td colspan=3 class="form"><%=rs("nshop_code")%></td>
							</tr>
							<tr>
								<td width=110 style="padding:5px"><font size=2>��ü��(�ѱ�)</font></td>
								<td width=185 class="form"><%=rs("nshop_kname")%></td>
								<td width=105><font size=2>��ü��(����)</font></td>
								<td width=195 class="form"><%=rs("nshop_ename")%></td>
							</tr>  
							<tr>
								<td style="padding:5px"><font size=2>ī�װ�</font></td>
								<td align="center" colspan=3 class=font9>
									<table border=0 cellpadding=0 cellspacing=0 width=100%>
<%	sql_ca="SELECT * FROM nshop_category where nshop_code='"&rs("nshop_code")&"' ORDER BY nshop_category"
	set rs_ca = Conn.Execute(sql_ca)
	if rs_ca.eof then
		ca="ī�װ� �̵��" %>
										<tr>
											<td><%=ca%></td>
											<td width=90 align=right><INPUT type="button" value="ī�װ��߰�" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:84px; height:18px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('nshop_category_input.asp?nshop_code=<%=rs("nshop_code")%>', 'category_input', 'width=400,height=160') ;" id=button2 name=button2></td>
										</tr>
<%	else
		do until rs_ca.eof
			sql_ca1 = "SELECT first_name FROM nshop_first where first_code='"&left(rs_ca("nshop_category"),2)&"'"
			set rs_ca1 = Conn.Execute(sql_ca1)
				ca=rs_ca1(0)
			set rs_ca1 = nothing
			
			sql_ca2 = "SELECT second_name FROM nshop_second where first_code='"&left(rs_ca("nshop_category"),2)&"' and second_code='"&mid(rs_ca("nshop_category"),3,2)&"'"
			set rs_ca2 = Conn.Execute(sql_ca2)
				if not rs_ca2.eof then
					ca=ca&":"&rs_ca2(0)
				end if
			set rs_ca2 = nothing
			
			sql_ca3 = "SELECT third_name FROM nshop_third where first_code='"&left(rs_ca("nshop_category"),2)&"' and second_code='"&mid(rs_ca("nshop_category"),3,2)&"' and third_code='"&right(rs_ca("nshop_category"),2)&"'"
			set rs_ca3 = Conn.Execute(sql_ca3)
				if not rs_ca3.eof then
					ca=ca&":"&rs_ca3(0)
				end if
			set rs_ca3 = nothing %>
										<tr>
											<td width=35><INPUT type="button" value="����" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:30px; height:18px; BORDER:1x solid #778899; cursor:hand;" onclick="javascript:if (confirm('ī�װ��� ������ �����Ͻðڽ��ϱ�?')) {location.replace('nshop_category_del_result.asp?nshop_code=<%=rs_ca("nshop_code")%>&nshop_category=<%=rs_ca("nshop_category")%>&nshop_idx=<%=rs("nshop_idx")%>&page=<%=page%>&startpage=<%=startpage%>&re=detail');}" id=button3 name=button3></td>
											<td>
									<% if isnull(rs_ca("regdate")) then%>
												<%=ca%>
									<% else %>
										<% if datediff("s",cdate(rs_ca("regdate")) ,now) <=100 then%>
												<font color=darkred><%=ca%></font>
										<%else%>
												<%=ca%>
										<%end if%>
									<% end if %>
											</td>
										</tr>
	<%	rs_ca.movenext
		loop %>
										<tr>
											<td colspan=2 align=right><INPUT type="button" value="ī�װ��߰�" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:84px; height:18px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('nshop_category_input.asp?nshop_code=<%=rs("nshop_code")%>', 'category_input', 'width=400,height=160') ;" id=button1 name=button1></td>
										</tr>
<%	end if
	set rs_ca = nothing	 %>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>URL</font></td>
								<td colspan=3 class="form"><%=rs("url")%></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>��ǥ�̸���</font></td>
								<td colspan=3 class="form"><%=rs("email")%></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>��ȭ</font></td>
								<td class="form"><%=rs("tel")%></td>
								<td><font size=2>�ѽ�</font></td>
								<td class="form"><%=rs("fax")%></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>�ּ�</font></td>
								<td colspan=3 class="form"><%=rs("addr1")%>&nbsp;<%=rs("addr2")%><%if not rs("zip")="" then%>&nbsp;(<%=rs("zip")%>)<%end if%></td>
							</tr>
<%
	Select Case rs("module")
		Case "N" module = "��ġ�ȵ�" 
		Case "Y" module = "��ġ��" 
	End Select

	Select Case rs("nshop")
		Case "N" nshop = "NO NSHOP" 
		Case "Y" nshop = "NSHOP" 
	End Select
%>
							<tr>
								<td style="padding:5px"><font size=2>��⼳ġ</font></td>
								<td class="form"><%=module%></td>
								<td><font size=2>NSHOP����</font></td>
								<td class="form"><%=nshop%></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>��ü�ΰ�</font></td>
								<td>
								<%if rs("img_logo") = "" or isnull(rs("img_logo")) then%>
									<input type=button value="�űԵ��(�������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:130px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('nshop_img_edit.asp?nshop_idx=<%=request("nshop_idx")%>&img=SN', 'img_edit', 'width=400,height=160') ;" id=button3 name=button3>
								<%else%>
									<input type=button value="����(��������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:120px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('nshop_img_edit.asp?nshop_idx=<%=request("nshop_idx")%>&img=SY', 'img_edit', 'width=400,height=160') ;" id=button4 name=button4>
								<%end if%>
								</td>
								<td><font size=2>����ȭ��</font></td>
								<td>
								<%if rs("img_main") = "" or isnull(rs("img_main")) then%>
									<input type=button value="�űԵ��(�������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:130px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('nshop_img_edit.asp?nshop_idx=<%=request("nshop_idx")%>&img=LN', 'img_edit', 'width=400,height=160') ;" id=button1 name=button1>
								<%else%>
									<input type=button value="����(��������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:120px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('nshop_img_edit.asp?nshop_idx=<%=request("nshop_idx")%>&img=LY', 'img_edit', 'width=400,height=160') ;" id=button2 name=button2>
								<%end if%>
								</td>
							</tr>
							<tr>
								<td style="padding:5px"></td>
								<td colspan=3 class=font9><font color=darkred>�̹����� �� ��ư�� ���� ���(����)/������ �ּ���!!</font></td>
							</tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>��ü����<br>(�ڼ���)</font></td>
						        <td colspan=3 class="form"><%=Replace(rs("S_content"),chr(13)&chr(10),"<br>")%></td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>��ü����<br>(�ڼ���)</font></td>
						        <td colspan=3 class="form"><%=Replace(rs("L_content"),chr(13)&chr(10),"<br>")%></td>
						    </tr>
						    <tr>
						        <td style="padding:5px" align=center><b>��ü�����</b></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td width=100 align=center><b>�̸�</b></td>
											<td width=100 align=center><b>��ȭ��ȣ</b></td>
											<td width=240 align=center><b>�̸���</b></td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>����(������)����</font></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td style="padding:5px" width=100 class="form"><%=rs("captain1_name")%>&nbsp;</td>
											<td width=100 class="form"><%=rs("captain1_tel")%>&nbsp;</td>
											<td width=240 class="form"><%=rs("captain1_email")%>&nbsp;</td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>����Ʈ�����</font></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td style="padding:5px" width=100 class="form"><%=rs("captain2_name")%>&nbsp;</td>
											<td width=100 class="form"><%=rs("captain2_tel")%>&nbsp;</td>
											<td width=240 class="form"><%=rs("captain2_email")%>&nbsp;</td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>�������</font></td>
						        <td colspan=3>
									<table border=0>
										<tr>
											<td style="padding:5px" width=100 class="form"><%=rs("captain3_name")%>&nbsp;</td>
											<td width=100 class="form"><%=rs("captain3_tel")%>&nbsp;</td>
											<td width=240 class="form"><%=rs("captain3_email")%>&nbsp;</td>
										</tr>
									</table>
								</td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center>
									<input type=button value="����" onclick="location.replace('nshop_edit.asp?nshop_idx=<%=rs("nshop_idx")%>&page=<%=page%>&startpage=<%=startpage%>')">&nbsp;&nbsp;&nbsp;
									<input type=button value="����ȭ��" onclick="location.replace('../default.asp')">
								</td>
						    </tr>
					    </table>
<% end if %>
					</td>
				</tr>
		    </table>
		</tr>
	</td>
</table>
</body>
</html>