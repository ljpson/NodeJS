
<html>
<head><title>NSHOP ��ǰ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
//	if (document.reg.nshop_code.value == "" ) {	alert("��ü���� �Է��Ͻʽÿ� "); document.reg.nshop_code.focus(); return false;	}
//	if (document.reg.first_code.value == "" ) {	alert("ù��° ī�װ��� �Է��Ͻʽÿ� "); document.reg.first_code.focus(); return false; }
	if (document.reg.goods_name.value == "" ) {	alert("��ǰ���� �Է��Ͻʽÿ� "); document.reg.goods_name.focus(); return false; }


	if (document.reg.goods_price.value == "" ) {	alert("��ǰ������ �Է��Ͻʽÿ� "); document.reg.goods_price.focus(); return false; }
	var goods_price=document.reg.goods_price.value;
	var ichk=0;
	for (var i=0;i<goods_price.length;i++) {
		var ch1 = goods_price.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("��ǰ������ ���ڷ� �Է��Ͻʽÿ� "); document.reg.goods_price.focus(); return false; }


	if (document.reg.goods_type.value == "2" && document.reg.goods_discount_price.value == "") {	alert("���λ�ǰ�� ���ΰ����� �Է��ϼž� �մϴ�. "); document.reg.goods_discount_price.focus(); return false; }
	var goods_discount_price=document.reg.goods_discount_price.value;
	var ichk=0;
	for (var i=0;i<goods_discount_price.length;i++) {
		var ch1 = goods_discount_price.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("���ΰ����� ���ڷ� �Է��Ͻʽÿ� "); document.reg.goods_discount_price.focus(); return false; }
	

	if (document.reg.award_amount.value == "" ) {	alert("��������Ʈ�� �Է��Ͻʽÿ� "); document.reg.award_amount.focus(); return false; }
	var award_amount=document.reg.award_amount.value;
	var ichk=0;
	for (var i=0;i<award_amount.length;i++) {
		var ch1 = award_amount.substring(i,i+1);
	    if (ch1<"0" || ch1 >"9") { ichk=ichk+1}
	    if (ch1==".") {ichk=0}
	}
	if  (ichk!=0) {	alert("��������Ʈ�� ���ڷ� �Է��Ͻʽÿ� "); document.reg.award_amount.focus(); return false; }
	

	if (document.reg.sale_type.value == "1" && document.reg.capacity.value == "") {	alert("�����ǸŴ� �������� �Է��ϼž� �մϴ�. "); document.reg.capacity.focus(); return false; }
	if (document.reg.S_image.value!=""&&document.reg.S_image.value.indexOf('.gif')==-1) {
		if(document.reg.S_image.value!="" && document.reg.S_image.value.indexOf('.jpg')==-1) { alert("�̹����� gif�� jpg�� �Է��ϼž� �մϴ�.");document.reg.S_image.focus();return false; }
	}
	if (document.reg.L_image.value!=""&&document.reg.L_image.value.indexOf('.gif')==-1) {
		if(document.reg.L_image.value!="" && document.reg.L_image.value.indexOf('.jpg')==-1) { alert("�̹����� �ҹ��� gif�� jpg�� �Է��ϼž� �մϴ�.");document.reg.L_image.focus();return false; }
	}
	if (document.reg.S_content.value.length < 12 ) { alert(" ��ǰ������ �ڼ��� �Է��Ͻʽÿ� "); document.reg.S_content.select(); return false; }
	if (document.reg.L_content.value.length < 50 ) { alert(" ��ǰǰ������ �ڼ��� �Է��Ͻʽÿ� "); document.reg.L_content.select(); return false; }
}

function capacity_change()
{
	if (document.reg.sale_type.value == "0" ) { document.reg.capacity.value="0"; }
	if (document.reg.sale_type.value == "1" ) { document.reg.capacity.value=""; }
	if (document.reg.sale_type.value == "2" ) { document.reg.capacity.value="����"; }
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
<form action=goods_input_result.asp method=post  name="reg"   onSubmit="return check_len(this)" ENCTYPE="multipart/form-data">
<table width=700 align=center>
	<tr>
		<td align=center>
			<table width=600 cellpadding=1 cellspacing=0>
				<tr><td height=50 align=center><font size=2 color="000000"><b>NSHOP ��ǰ���</b></font></td></tr>
				<tr>
					<td align=center bgcolor="#9999CC">
<% if session("nshop_id")="" then %>
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td height=150 align=center>
									��ڴ��� �ڸ��� ���� �ð��� �����Ǿ�<br>
									���Ȼ� �����ڸ�带 ������׽��ϴ�.<br>
									�ٽ� �α��� �Ͻð�, ����� �ּ���!!<br><br><br>
									<input type=button value="�����ڸ���" style="BACKGROUND-COLOR:#cccccc; COLOR:#222222; height:18px; BORDER:1x solid #778899" onClick="location.replace('../default.asp')">
								</td>
							</tr>
						</table>
<% else %>
						<table width=600 cellpadding=1 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td width=5 rowspan=12></td>
								<td height=10 colspan=4><input type=hidden name=nshop_code value="<%=session("nshop_id")%>"></td>
							</tr>  
							<tr>
								<td style="padding:5px"><font size=2>��ǰ��</font></td>
								<td><input type=text name=goods_name  size=22 maxlength=50 class="form"></td>
								<td><font size=2>��ǰ�԰�</font></td>
								<td><input type=text name=goods_size  size=22 maxlength=50 class="form"></td>
							</tr>       
							<tr>
								<td style="padding:5px"><font size=2>��ǰ����</font></td>
								<td><input type=text name=goods_price  size=19 class="form"> ��</td>
								<td><font size=2>��ǰŸ��</font></td>
								<td>
									<select name=goods_type class="form">
						                <option value="1" selected>�Ϲݻ�ǰ</option>
										<option value="2">���λ�ǰ</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>���ΰ���</font></td>
								<td><input type=text name=goods_discount_price  size=19 class="form"> ��</td>
								<td><font size=2>��������Ʈ</td>
								<td><input type=text name=award_amount  size=15 class="form"> nPoint</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>�Ǹ�Ÿ��</font></td>
								<td>
									<select name=sale_type class="form" onchange=capacity_change()>
						                <option value="0">ǰ��</option>
										<option value="1" selected>�����Ǹ�</option>
										<option value="2">�����Ǹ�</option>
									</select>
								</td>
								<td><font size=2>������</font></td>
								<td><input type=text name=capacity  size=15 maxlength=30 class="form"> ��</td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>�����̹���</font></td>
								<td colspan=3><INPUT type="file" name=S_image size=30 class="form"></td>
							</tr>
							<tr>
								<td style="padding:5px"><font size=2>ū�̹���</font></td>
								<td colspan=3><INPUT type="file" name=L_image size=30 class="form"></td>
							</tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>��ǰ����<br>(�ڼ���)</font></td>
						        <td colspan=3><textarea name=S_content  rows=2 cols=70 maxlength=255 class="form">����80~100��, �ѱ�30~40�� �̳�</textarea></td>
						    </tr>
						    <tr>
						        <td style="padding:5px" valign=top><font size=2>��ǰ����<br>(�ڼ���)</font></td>
						        <td colspan=3><textarea name=L_content  rows=15 cols=70 maxlength=5000 class="form">����2000��, �ѱ�1000�� �̳�</textarea></td>
						    </tr>
						    <tr>
								<td style="padding:15px" colspan=4 align=center><input type=submit value="��ǰ���� �Է�">&nbsp;&nbsp;&nbsp;
								<input type=reset  value=�ٽ��ۼ�>&nbsp;&nbsp;&nbsp;
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
</form>
</body>
</html>