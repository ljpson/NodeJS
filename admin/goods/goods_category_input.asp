<%
set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	sql="SELECT nshop_code,goods_name,S_image from goods_info where goods_code='"&request("goods_code")&"'"
	Set rs=Conn.Execute(sql)
%>
<html>
<head><title>NSHOP 상품등록</title></head>

<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
	if (document.reg.first_code.value == "") { alert("첫번째 카테고리를 선택하세요!!");return false; }
	if (document.reg.second_code.value == "") { alert("두번째 카테고리를 선택하세요!!");return false; }
	if (document.reg.third_code.value == "") { alert("세번째 카테고리를 선택하세요!!");return false; }
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
	.form {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
	.font9 {  font-size: 10pt; font-family: "굴림체", "Verdana", "sans-serif"}
//-->
</style>
<body text="#222222" link="#004cb3" vlink="#b300a9" alink="#ca2204" leftmargin=0 topmargin=0>
<form action="goods_category_input.asp" method=post  name="reg">
<table width=400 align=center height=160>
	<tr>
		<td align=center bgcolor="#EEEECC">
			<table width=390 cellpadding=1 cellspacing=3 valign=middle border=0>
				<INPUT TYPE="hidden" name="degree" value="">
				<input type=hidden name=goods_code  size=22 maxlength=50 class="form" value="<%=request("goods_code")%>">
				<input type=hidden name=st  size=22 maxlength=50 class="form" value="<%=request("st")%>">
<%	if int(Request.form("degree")) >= 5 then

		first_code=request("first_code")
		second_code=request("second_code")
		third_code=request("third_code")
		
		category=first_code&second_code&third_code

		sqlselect="select * from goods_category where goods_code='"&request("goods_code")&"' and goods_category='"&category&"'"
		set rsselect=Conn.Execute(sqlselect)

		if rsselect.eof then		
			sqlinsert="insert into goods_category(goods_code,goods_category,regdate) values ('"&request("goods_code")&"','"&category&"',getdate())"
			Conn.Execute(sqlinsert)
			
			if not first_code="00" then
				sqlupdate1="update goods_first set first_qty=first_qty+1 where first_code='"&first_code&"'"
				Conn.Execute(sqlupdate1)
			end if
			if not second_code="00" then
				sqlupdate2="update goods_second set second_qty=second_qty+1 where first_code='"&first_code&"' and second_code='"&second_code&"'"
				Conn.Execute(sqlupdate2)
			end if
			if not third_code="00" then
				sqlupdate3="update goods_third set third_qty=third_qty+1 where first_code='"&first_code&"' and second_code='"&second_code&"' and third_code='"&third_code&"'"
				Conn.Execute(sqlupdate3)
			end if
		else %>
				<INPUT TYPE="hidden" name="first_code" value="<%=request("first_code")%>">
				<INPUT TYPE="hidden" name="second_code" value="<%=request("second_code")%>">
				<INPUT TYPE="hidden" name="third_code" value="<%=request("third_code")%>">
<script>
	alert("동일한 카테고리가 이미 등록되어 있습니다.");
	fncsubmit(document.reg,4);
</script>
	<%	end if %>
			    <tr>
					<td align=center valign=middle>
						<table border=0>
							<tr>
								<td valign=middle align=center>
									상품<font color=darkblue>[<%=rs("goods_name")%>]<%=category%></font>의 카테고리가<br>정상적으로 등록되었습니다.<br><br>
									카테고리를 추가로 등록하시려면, 아래 <font color=darkred>[추가]</font> 버튼을 누르시고,<br>
									카테고리 등록을 마치려면, <font color=darkred>[마침]</font> 버튼을 눌러주세요!!<br><br>
								</td>
							</tr>
							<tr>
								<td valign=middle align=center>
									<input type=button value="추가" onclick="<% if not request("st")="input" then %>opener.location.reload(); location.replace('goods_category_input.asp?goods_code=<%=request("goods_code")%><% else %>location.replace('goods_category_input.asp?goods_code=<%=request("goods_code")%>&st=input<%end if%>')" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899">&nbsp;&nbsp;&nbsp;
									<input type=button value="마침" onclick="<% if not request("st")="input" then %>opener.location.reload(); self.close();<%else%>opener.location.replace('goods_list.asp'); self.close();<%end if%>" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899">
								</td>
							</tr>
						</table>
					</td>
			    </tr>
<%	else %>
			    <tr>
					<td height=50><b>카테고리 등록</b></td>
					<td height=30 colspan=2 align=right style=padding-right:7px;>
						<table height=45 border=0>
							<tr>
								<td valign=bottom align=right><font color=darkblue>상품명 : <%=rs("goods_name")%></font></td>
	<%	if not rs("S_image")="" then %>
								<td valign=bottom align=right><img src="../../../npoint/images/goods/<%=rs("nshop_code")%>/<%=rs("S_image")%>" height=45></td>
	<%	end if %>
							</tr>
						</table>
					</td>
			    </tr>
				<tr>
					<td width=130>
						<select name=first_code class="form" onchange="javascript:fncsubmit(document.reg,2)">
				            <option value="">첫번째 카테고리</option>
							<option value="">---------------</option>
	<%	sql1="SELECT * from goods_first"
		Set rs1=Conn.Execute(sql1)

		if rs1.eof then 
			session("category_msg")="현재 카테고리가 없습니다.<font color=darkblue>씨그마테크 관리자</font>에게 문의하세요!!"
		else
			do until rs1.eof %>
							<option value="<%=rs1("first_code")%>"<% if rs1("first_code")=request("first_code") then %> selected<% end if%>><%=rs1("first_name")%></option>
		<%	rs1.movenext
			loop
			session("category_msg")="<font color=darkred>첫번째 카테고리를 선택하세요!!</font>"
	
		end if	%>
						</select>
					</td>
					
					
					
					<td width=130>
	<%	if int(Request.form("degree")) >= 2 then
			sql2="SELECT * from goods_second where first_code='"&request("first_code")&"'"
			Set rs2=Conn.Execute(sql2)
	
			if rs2.eof then %>
						<INPUT TYPE="hidden" name="second_code" value="00">
			<%	session("category_msg")="더 이상 선택할 카테고리가 없습니다. <br>위의 카테고리에 제품을 등록하시려면,<font color=darkred>[등록완료]</font>버튼을 눌러주세요!!"
			else %>
						<select name=second_code class="form" onchange="javascript:fncsubmit(document.reg,3)">
				            <option value="">두번째 카테고리</option>
							<option value="">---------------</option>
			<%	do until rs2.eof %>
							<option value="<%=rs2("second_code")%>"<% if rs2("second_code")=request("second_code") then %> selected<% end if%>><%=rs2("second_name")%></option>
			<%	rs2.movenext
				loop
				session("category_msg")="<font color=darkred>두번째 카테고리를 선택하세요!!</font>" %>
						</select>
		<%	end if
		end if	%>
					</td>
					
					
					
					<td width=130>
	<%	if int(Request.form("degree")) >= 3 then
			sql3="SELECT * from goods_third where first_code='"&request("first_code")&"' and second_code='"&request("second_code")&"'"
			Set rs3=Conn.Execute(sql3)
	
			if rs3.eof then %>
						<INPUT TYPE="hidden" name="third_code" value="00">
			<%	session("category_msg")="더 이상 선택할 카테고리가 없습니다. <br>위의 카테고리에 제품을 등록하시려면,<font color=darkred>[등록완료]</font>버튼을 눌러주세요!!"
			else %>
						<select name=third_code class="form" onchange="javascript:fncsubmit(document.reg,4)">
				            <option value="">세번째 카테고리</option>
							<option value="">---------------</option>
			<%	do until rs3.eof %>
							<option value="<%=rs3("third_code")%>"<% if rs3("third_code")=request("third_code") then %> selected<% end if%>><%=rs3("third_name")%></option>
			<%	rs3.movenext
				loop
				session("category_msg")="<font color=darkred>세번째 카테고리를 선택하세요!!</font>" %>
						</select>
		<%	end if
		end if	%>
					</td>
				</tr>
	<%	if int(Request.form("degree")) >= 4 then
			session("category_msg")="더 이상 선택할 카테고리가 없습니다. <br>위의 카테고리에 제품을 등록하시려면,<font color=darkred>[등록완료]</font>버튼을 눌러주세요!!"
		end if %>
			    <tr>
					<td colspan=3 height=30><%=session("category_msg")%></td>
			    </tr>
			    <tr>
					<td colspan=3 height=30 align=center>
						<input type=button value="등록완료" onclick="javascript:check_len();" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899">&nbsp;&nbsp;&nbsp;
						<input type=button value=닫기 onclick="self.close();" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; BORDER:1x solid #778899">
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