<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT * from goods_info where goods_idx="&request("goods_idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>NSHOP ��ǰ���</title>
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
	intReturn = confirm("��ǰ�� ������ �����Ͻðڽ��ϱ�?");
	
	if (intReturn) 
	{	
		location.replace('goods_del_result.asp?goods_code=<%=rs("goods_code")%>&page=<%=page%>&startpage=<%=startpage%>');
	}
}

function refresh_chk()
{
	intReturn = confirm("��ǰ�� ������ �����Ͻðڽ��ϱ�?");
	
	if (intReturn) 
	{	
		location.replace('goods_refresh_result.asp?goods_code=<%=rs("goods_code")%>&page=<%=page%>&startpage=<%=startpage%>');
	}
}
</script>
<body text="#222222" link="#004cb3" vlink="#b300a9" alink="#ca2204">
<table width=700 align=center>
	<tr>
		<td align=center>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>NSHOP ��ǰ������</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td height=10 colspan=4></td>
								<td width=5 rowspan=12></td>
							</tr>
							<tr>
								<td width=90 style="padding:5px"><font size=2>��ü��</td>
<%
Sqlnn="SELECT nshop_kname from nshop_info where nshop_code='"&rs("nshop_code")&"'"
Set rsnn=Conn.Execute(Sqlnn)
%>
								<td width=200 class="inkform"><%=rsnn("nshop_kname")%></td>
								<td width=100><font size=2>��ǰ�ڵ�</td>
								<td width=200 class="inkform"><%=rs("goods_code")%></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>ī�װ�</td>
								<td align="center" colspan=3 class=font9>
									<table border=0 cellpadding=0 cellspacing=0 width=100%>
<%	sql_ca="SELECT * FROM goods_category where goods_code='"&rs("goods_code")&"' ORDER BY goods_category"
	set rs_ca = Conn.Execute(sql_ca)
	if rs_ca.eof then
		ca="ī�װ� �̵��" %>
										<tr>
											<td><%=ca%></td>
								<% if rs("del")="Y" then %>
											<td width=90 align=right><INPUT type="button" value="ī�װ��߰�" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:84px; height:18px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('goods_category_input.asp?goods_code=<%=rs("goods_code")%>', 'category_input', 'width=400,height=160') ;" id=button2 name=button2></td>
								<% end if %>
										</tr>
<%	else
		do until rs_ca.eof
			sql_ca1 = "SELECT first_name FROM goods_first where first_code='"&left(rs_ca("goods_category"),2)&"'"
			set rs_ca1 = Conn.Execute(sql_ca1)
				ca=rs_ca1(0)
			set rs_ca1 = nothing
			
			sql_ca2 = "SELECT second_name FROM goods_second where first_code='"&left(rs_ca("goods_category"),2)&"' and second_code='"&mid(rs_ca("goods_category"),3,2)&"'"
			set rs_ca2 = Conn.Execute(sql_ca2)
				if not rs_ca2.eof then
					ca=ca&":"&rs_ca2(0)
				end if
			set rs_ca2 = nothing
			
			sql_ca3 = "SELECT third_name FROM goods_third where first_code='"&left(rs_ca("goods_category"),2)&"' and second_code='"&mid(rs_ca("goods_category"),3,2)&"' and third_code='"&right(rs_ca("goods_category"),2)&"'"
			set rs_ca3 = Conn.Execute(sql_ca3)
				if not rs_ca3.eof then
					ca=ca&":"&rs_ca3(0)
				end if
			set rs_ca3 = nothing %>
										<tr>
								<% if rs("del")="Y" then %>
											<td width=35><INPUT type="button" value="����" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:30px; height:18px; BORDER:1x solid #778899; cursor:hand;" onclick="javascript:if (confirm('ī�װ��� ������ �����Ͻðڽ��ϱ�?')) {location.replace('goods_category_del_result.asp?goods_code=<%=rs_ca("goods_code")%>&goods_category=<%=rs_ca("goods_category")%>&goods_idx=<%=rs("goods_idx")%>&page=<%=page%>&startpage=<%=startpage%>&re=detail');}"></td>
								<% end if %>
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
								<% if rs("del")="Y" then %>
										<tr>
											<td colspan=2 align=right><INPUT type="button" value="ī�װ��߰�" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:84px; height:18px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('goods_category_input.asp?goods_code=<%=rs("goods_code")%>', 'category_input', 'width=400,height=160') ;" id=button1 name=button1></td>
										</tr>
								<% end if %>
<%	end if
	set rs_ca = nothing	 %>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>��ǰ��</td>
								<td class="form"><%=rs("goods_name")%></td>
								<td><font size=2>��ǰ�԰�</td>
								<td class="form"><%=rs("goods_size")%></td>
							</tr>       
<%
	Select Case rs("goods_type")
		Case "1" goods_type = "�Ϲݻ�ǰ" 
		Case "2" goods_type = "���λ�ǰ" 
	End Select
%>
							<tr>
								<td style="padding:5px"><font size=2>��ǰ����</td>
								<td class="form"><%=rs("goods_price")%> ��</td>
								<td><font size=2>��ǰŸ��</td>
								<td class="form"><%=goods_type%></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>���ΰ���</td>
								<td class="form"><%=rs("goods_discount_price")%> ��</td>
								<td><font size=2>��������Ʈ</td>
								<td class="form"><%=rs("award_amount")%> nPoint</td>
							</tr>
<%
	Select Case rs("sale_type")
		Case "0" sale_type = "ǰ��" 
		Case "1" sale_type = "�����Ǹ�" 
		Case "2" sale_type = "�����Ǹ�" 
	End Select
%>
							<tr>
								<td style="padding:5px"><font size=2>�Ǹ�Ÿ��</td>
								<td class="form"><%=sale_type%></td>
								<td><font size=2>������</td>
								<td class="form"><%=rs("capacity")%> ��</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>�����̹���</td>
								<td>
								<%if rs("S_image") = "" or isnull(rs("S_image")) then%>
									<input type=button value="�űԵ��(�������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:130px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('goods_img_edit.asp?goods_idx=<%=request("goods_idx")%>&img=SN', 'img_edit', 'width=400,height=160') ;" id=button3 name=button3>
								<%else%>
									<input type=button value="����(��������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:120px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('goods_img_edit.asp?goods_idx=<%=request("goods_idx")%>&img=SY', 'img_edit', 'width=400,height=160') ;" id=button4 name=button4>
								<%end if%>
								</td>
								<td><font size=2>ū�̹���</td>
								<td>
								<%if rs("L_image") = "" or isnull(rs("L_image")) then%>
									<input type=button value="�űԵ��(�������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:130px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('goods_img_edit.asp?goods_idx=<%=request("goods_idx")%>&img=LN', 'img_edit', 'width=400,height=160') ;" id=button1 name=button1>
								<%else%>
									<input type=button value="����(��������)" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; width:120px; height:20px; BORDER:1x solid #778899; cursor:hand;" onclick="window.open('goods_img_edit.asp?goods_idx=<%=request("goods_idx")%>&img=LY', 'img_edit', 'width=400,height=160') ;" id=button2 name=button2>
								<%end if%>
								</td>
							</tr>
							<tr>
								<td style="padding:5px"></td>
								<td colspan=3 class=font9><font color=darkred>�̹����� �� ��ư�� ���� �̹����� ���(����)/������ �ּ���!!</font></td>
							</tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>��ǰ����<br>(�ڼ���)</td>
						        <td colspan=3 class="form"><%=Replace(rs("S_content"),chr(13)&chr(10),"<br>")%></td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>��ǰ����<br>(�ڼ���)</td>
						        <td colspan=3 class="form"><%=Replace(rs("L_content"),chr(13)&chr(10),"<br>")%></td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center>
								<% if rs("del")="Y" then %>
									<input type=button value="����" onclick="location.replace('goods_edit.asp?goods_idx=<%=rs("goods_idx")%>&page=<%=page%>&startpage=<%=startpage%>')">&nbsp;&nbsp;&nbsp;
									<input type=button  value="����" onclick="del_chk()">&nbsp;&nbsp;&nbsp;
									<input type=button  value="��ǰ���" onclick="location.replace('goods_list.asp?page=<%=page%>&startpage=<%=startpage%>')"></td>
								<% else %>
									<input type=button  value="����" onclick="refresh_chk()">&nbsp;&nbsp;&nbsp;
									<input type=button  value="��ǰ���" onclick="location.replace('goods_del_list.asp?page=<%=page%>&startpage=<%=startpage%>')"></td>
								<% end if %>
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