<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT *,S_image,L_image,S_content,L_content from goods_info where goods_idx="&request("goods_idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>NSHOP 상품등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
	if (document.reg.goods_name.value == "" ) {	alert("상품명을 입력하십시오 "); document.reg.goods_name.focus(); return false; }


	if (document.reg.goods_price.value == "" ) {	alert("상품가격을 입력하십시오 "); document.reg.goods_price.focus(); return false; }
	var goods_price=document.reg.goods_price.value;
	var ichk=0;
	for (var i=0;i<goods_price.length;i++) {
		var ch1 = goods_price.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("상품가격을 숫자로 입력하십시오 "); document.reg.goods_price.focus(); return false; }


	if (document.reg.goods_type.value == "2" && document.reg.goods_discount_price.value == "") {	alert("할인상품은 할인가격을 입력하셔야 합니다. "); document.reg.goods_discount_price.focus(); return false; }
	var goods_discount_price=document.reg.goods_discount_price.value;
	var ichk=0;
	for (var i=0;i<goods_discount_price.length;i++) {
		var ch1 = goods_discount_price.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("할인가격을 숫자로 입력하십시오 "); document.reg.goods_discount_price.focus(); return false; }
	

	if (document.reg.award_amount.value == "" ) {	alert("적립포인트을 입력하십시오 "); document.reg.award_amount.focus(); return false; }
	var award_amount=document.reg.award_amount.value;
	var ichk=0;
	for (var i=0;i<award_amount.length;i++) {
		var ch1 = award_amount.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("적립포인트를 숫자로 입력하십시오 "); document.reg.award_amount.focus(); return false; }
	

	if (document.reg.sale_type.value == "1" && document.reg.capacity.value == "") {	alert("한정판매는 보유량을 입력하셔야 합니다. "); document.reg.capacity.focus(); return false; }
	if (document.reg.S_content.value.length < 20 ) { alert(" 상품설명을 자세히 입력하십시오 "); document.reg.S_content.select(); return false; }
	if (document.reg.L_content.value.length < 50 ) { alert(" 상품품설명을 자세히 입력하십시오 "); document.reg.L_content.select(); return false; }
}

function capacity_change()
{
	if (document.reg.sale_type.value == "0" ) { document.reg.capacity.value="0"; }
	if (document.reg.sale_type.value == "1" ) { document.reg.capacity.value=""; }
	if (document.reg.sale_type.value == "2" ) { document.reg.capacity.value="무한"; }
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
<form action=goods_edit_result.asp method=post  name="reg"   onSubmit="return check_len(this)">
<table width=700 align=center>
	<tr>
		<td align=center>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>NSHOP 상품수정</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td width=5 rowspan=12></td>
								<td height=10 colspan=4></td>
							</tr>
<%
Sqlnn="SELECT nshop_kname from nshop_info where nshop_code='"&rs("nshop_code")&"'"
Set rsnn=Conn.Execute(Sqlnn)
%>
							<tr>
								<td style="padding:5px"><font size=2>업체명</td>
								<td>
									<input type=text name=nshop_name  size=22 maxlength=50 class="form" value="<%=rsnn("nshop_kname")%>" disabled>
									<input type=hidden name=nshop_code  size=22 maxlength=50 class="form" value="<%=rs("nshop_code")%>">
					            </td>
								<td><font size=2>상품코드</td>
								<td width=225>
									<input type=text name=goods_code  size=22 maxlength=50 class="form" value="<%=rs("goods_code")%>" disabled>
									<input type=hidden name=goods_code  size=22 maxlength=50 class="form" value="<%=rs("goods_code")%>">
									<input type=hidden name=page  size=22 maxlength=50 class="form" value="<%=page%>">
									<input type=hidden name=startpage  size=22 maxlength=50 class="form" value="<%=startpage%>">
								</td>
							</tr>                
							<tr>
								<td style="padding:5px"><font size=2>상품명</td>
								<td><input type=text name=goods_name  size=22 maxlength=50 class="form" value="<%=rs("goods_name")%>"></td>
								<td><font size=2>상품규격</td>
								<td><input type=text name=goods_size  size=22 maxlength=50 class="form" value="<%=rs("goods_size")%>"></td>
							</tr>       
							<tr>
								<td style="padding:5px"><font size=2>상품가격</td>
								<td><input type=text name=goods_price  size=19 class="form" value="<%=rs("goods_price")%>"> 원</td>
								<td><font size=2>상품타입</td>
								<td>
									<select name=goods_type class="form">
						                <option value="1" <%if rs("goods_type")="1" then%>selected<%end if%>>일반상품</option>
										<option value="2" <%if rs("goods_type")="2" then%>selected<%end if%>>할인상품</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>할인가격</td>
								<td><input type=text name=goods_discount_price  size=19 class="form" value="<%=rs("goods_discount_price")%>"> 원</td>
								<td><font size=2>적립포인트</td>
								<td><input type=text name=award_amount  size=15 class="form" value="<%=rs("award_amount")%>"> nPoint</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>판매타입</td>
								<td>
									<select name=sale_type class="form" onchange=capacity_change()>
						                <option value="0" <%if rs("sale_type")="0" then%>selected<%end if%>>품절</option>
										<option value="1" <%if rs("sale_type")="1" then%>selected<%end if%>>한정판매</option>
										<option value="2" <%if rs("sale_type")="2" then%>selected<%end if%>>무한판매</option>
									</select>
								</td>
								<td><font size=2>보유량</td>
								<td><input type=text name=capacity  size=15 maxlength=30 class="form" value="<%=rs("capacity")%>"> 개</td>
							</tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>상품설명<br>(자세히)</td>
						        <td colspan=3><textarea name=S_content  rows=2 cols=70 maxlength=255 class="form"><%=rs("S_content")%></textarea></td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>상품설명<br>(자세히)</td>
						        <td colspan=3><textarea name=L_content  rows=15 cols=70 maxlength=5000 class="form"><%=rs("L_content")%></textarea></td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center><input type=submit value="수정완료">&nbsp;&nbsp;&nbsp;
									<input type=reset  value=다시작성>&nbsp;&nbsp;&nbsp;
									<input type=button  value="상품목록" onclick="location.replace('goods_list.asp?page=<%=page%>&startpage=<%=startpage%>')"></td>
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