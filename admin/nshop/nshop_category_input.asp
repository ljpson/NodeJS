<%
set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	sql="SELECT nshop_code,nshop_kname,img_logo from nshop_info where nshop_code='"&request("nshop_code")&"'"
	Set rs=Conn.Execute(sql)
%>
<html>
<head><title>[NSHOP] �������� - ��ü(NSHOP)ī�װ����</title></head>

<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
	if (document.reg.first_code.value == "") { alert("ù��° ī�װ��� �����ϼ���!!");return false; }
	if (document.reg.second_code.value == "") { alert("�ι�° ī�װ��� �����ϼ���!!");return false; }
	if (document.reg.third_code.value == "") { alert("����° ī�װ��� �����ϼ���!!");return false; }
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
<body text="#222222" link="#004cb3" vlink="#b300a9" alink="#ca2204" leftmargin=0 topmargin=0>
<form action="nshop_category_input.asp" method=post  name="reg">
<table width=400 align=center height=160>
	<tr>
		<td align=center bgcolor="#EEEECC">
			<table width=390 cellpadding=1 cellspacing=3 valign=middle border=0>
				<INPUT TYPE="hidden" name="degree" value="">
				<input type=hidden name=nshop_code  size=22 maxlength=50 class="form" value="<%=request("nshop_code")%>">
<%	if int(Request.form("degree")) >= 5 then
		category=request("first_code")&request("second_code")&request("third_code")

		sqlselect="select * from nshop_category where nshop_code='"&request("nshop_code")&"' and nshop_category='"&category&"'"
		set rsselect=Conn.Execute(sqlselect)

		if rsselect.eof then		
			sqlinsert="insert into nshop_category(nshop_code,nshop_category,regdate) values ('"&request("nshop_code")&"','"&category&"',getdate())"
			Conn.Execute(sqlinsert)
		else %>
				<INPUT TYPE="hidden" name="first_code" value="<%=request("first_code")%>">
				<INPUT TYPE="hidden" name="second_code" value="<%=request("second_code")%>">
				<INPUT TYPE="hidden" name="third_code" value="<%=request("third_code")%>">
<script>
	alert("������ ī�װ��� �̹� ��ϵǾ� �ֽ��ϴ�.");
	fncsubmit(document.reg,4);
</script>
	<%	end if %>
			    <tr>
					<td align=center valign=middle>
						<table border=0>
							<tr>
								<td valign=middle align=center>
									��ǰ<font color=darkblue>[<%=rs("nshop_kname")%>]<%=category%></font>�� ī�װ���<br>���������� ��ϵǾ����ϴ�.<br><br>
									ī�װ��� �߰��� ����Ͻ÷���, �Ʒ� <font color=darkred>[�߰�]</font> ��ư�� �����ð�,<br>
									ī�װ� ����� ��ġ����, <font color=darkred>[��ħ]</font> ��ư�� �����ּ���!!<br><br>
								</td>
							</tr>
							<tr>
								<td valign=middle align=center>
									<input type=button value="�߰�" onclick="opener.location.reload(); location.replace('nshop_category_input.asp?nshop_code=<%=request("nshop_code")%>')" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899; cursor:hand;">&nbsp;&nbsp;&nbsp;
									<input type=button value="��ħ" onclick="opener.location.reload(); self.close();" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899; cursor:hand;">
								</td>
							</tr>
						</table>
					</td>
			    </tr>
<%	else %>
			    <tr>
					<td height=50><b>��ü(NSHOP)ī�װ����</b></td>
					<td height=30 colspan=2 align=right style=padding-right:7px;>
						<table height=45 border=0>
							<tr>
								<td valign=bottom align=right><font color=darkblue>��ü��:<br><%=rs("nshop_kname")%></font></td>
	<%	if not rs("img_logo")="" then %>
								<td valign=bottom align=right><img src="../../../npoint/images/shop/<%=rs("img_logo")%>" width=98 height=47></td>
	<%	end if %>
							</tr>
						</table>
					</td>
			    </tr>
				<tr>
					<td width=130>
						<select name=first_code class="form" onchange="javascript:fncsubmit(document.reg,2)">
				            <option value="">ù��° ī�װ�</option>
							<option value="">---------------</option>
	<%	sql1="SELECT * from nshop_first"
		Set rs1=Conn.Execute(sql1)

		if rs1.eof then 
			session("category_msg")="���� ī�װ��� �����ϴ�.<font color=darkblue>���׸���ũ ������</font>���� �����ϼ���!!"
		else
			do until rs1.eof %>
							<option value="<%=rs1("first_code")%>"<% if rs1("first_code")=request("first_code") then %> selected<% end if%>><%=rs1("first_name")%></option>
		<%	rs1.movenext
			loop
			session("category_msg")="<font color=darkred>ù��° ī�װ��� �����ϼ���!!</font>"
	
		end if	%>
						</select>
					</td>
					
					
					
					<td width=130>
	<%	if int(Request.form("degree")) >= 2 then
			sql2="SELECT * from nshop_second where first_code='"&request("first_code")&"'"
			Set rs2=Conn.Execute(sql2)
	
			if rs2.eof then %>
						<INPUT TYPE="hidden" name="second_code" value="00">
						<INPUT TYPE="hidden" name="third_code" value="00">
			<%	session("category_msg")="�� �̻� ������ ī�װ��� �����ϴ�. <br>���� ī�װ��� ��ǰ�� ����Ͻ÷���,<font color=darkred>[��ϿϷ�]</font>��ư�� �����ּ���!!"
			else %>
						<select name=second_code class="form" onchange="javascript:fncsubmit(document.reg,3)">
				            <option value="">�ι�° ī�װ�</option>
							<option value="">---------------</option>
			<%	do until rs2.eof %>
							<option value="<%=rs2("second_code")%>"<% if rs2("second_code")=request("second_code") then %> selected<% end if%>><%=rs2("second_name")%></option>
			<%	rs2.movenext
				loop
				session("category_msg")="<font color=darkred>�ι�° ī�װ��� �����ϼ���!!</font>" %>
						</select>
		<%	end if
		end if	%>
					</td>
					
					
					
					<td width=130>
	<%	if int(Request.form("degree")) >= 3 then
			sql3="SELECT * from nshop_third where first_code='"&request("first_code")&"' and second_code='"&request("second_code")&"'"
			Set rs3=Conn.Execute(sql3)
	
			if rs3.eof then %>
						<INPUT TYPE="hidden" name="third_code" value="00">
			<%	session("category_msg")="�� �̻� ������ ī�װ��� �����ϴ�. <br>���� ī�װ��� ��ǰ�� ����Ͻ÷���,<font color=darkred>[��ϿϷ�]</font>��ư�� �����ּ���!!"
			else %>
						<select name=third_code class="form" onchange="javascript:fncsubmit(document.reg,4)">
				            <option value="">����° ī�װ�</option>
							<option value="">---------------</option>
			<%	do until rs3.eof %>
							<option value="<%=rs3("third_code")%>"<% if rs3("third_code")=request("third_code") then %> selected<% end if%>><%=rs3("third_name")%></option>
			<%	rs3.movenext
				loop
				session("category_msg")="<font color=darkred>����° ī�װ��� �����ϼ���!!</font>" %>
						</select>
		<%	end if
		end if	%>
					</td>
				</tr>
	<%	if int(Request.form("degree")) >= 4 then
			session("category_msg")="�� �̻� ������ ī�װ��� �����ϴ�. <br>���� ī�װ��� ��ǰ�� ����Ͻ÷���,<font color=darkred>[��ϿϷ�]</font>��ư�� �����ּ���!!"
		end if %>
			    <tr>
					<td colspan=3 height=30><%=session("category_msg")%></td>
			    </tr>
			    <tr>
					<td colspan=3 height=30 align=center>
						<input type=button value="��ϿϷ�" onclick="javascript:check_len();" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899; cursor:hand;">&nbsp;&nbsp;&nbsp;
						<input type=button value=�ݱ� onclick="self.close();" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899; cursor:hand;">
					</td>
			    </tr>
<%	end if %>
		    </table>
		</tr>
	</td>
</table>
</form>
</body>
</html>