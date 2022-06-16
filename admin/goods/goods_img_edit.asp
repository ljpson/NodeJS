<%
set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	Sel="SELECT goods_idx,nshop_code,goods_code,goods_name,S_image,L_image from goods_info where goods_idx="&request("goods_idx")
	Set rs=Conn.Execute(Sel)
%>
<html>
<head><title>NSHOP 상품등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<SCRIPT LANGUAGE="JAVASCRIPT">
function check_len() 
{
<% if left(request("img"),1)="S" then %>
	if (document.reg.S_image.value!=""&&document.reg.S_image.value.indexOf('.gif')==-1) {
		if(document.reg.S_image.value!="" && document.reg.S_image.value.indexOf('.jpg')==-1) { alert("이미지는 gif나 jpg로 입력하셔야 합니다.");document.reg.S_image.focus();return false; }
	}
<% elseif left(request("img"),1)="L" then %>
	if (document.reg.L_image.value!=""&&document.reg.L_image.value.indexOf('.gif')==-1) {
		if(document.reg.L_image.value!="" && document.reg.L_image.value.indexOf('.jpg')==-1) { alert("이미지는 소문자 gif나 jpg로 입력하셔야 합니다.");document.reg.L_image.focus();return false; }
	}
<% end if %>
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
<form action="goods_img_edit_result.asp" method=post  name="reg"   onSubmit="return check_len(this)" ENCTYPE="multipart/form-data">
<table width=400 align=center height=160>
	<tr>
		<td align=center bgcolor="#EEEECC">
			<table width=400 cellpadding=1 cellspacing=3 valign=middle>
					<input type=hidden name=nshop_code  size=22 maxlength=50 class="form" value="<%=rs("nshop_code")%>">
					<input type=hidden name=goods_code  size=22 maxlength=50 class="form" value="<%=rs("goods_code")%>">
					<input type=hidden name=img  size=22 maxlength=50 class="form" value="<%=request("img")%>">
<% Select case request("img")
	case "SN" title="상품 ["&rs("goods_name")&"]의 작은이미지 신규등록"
	case "SY" title="상품 ["&rs("goods_name")&"]의 작은이미지 재등록"
	case "LN" title="상품 ["&rs("goods_name")&"]의 큰이미지 신규등록"
	case "LY" title="상품 ["&rs("goods_name")&"]의 큰이미지 재등록"
   end select %>
				<tr><td height=40 align=center><font size=2 color="000000"><b><%=title%></b></font></td></tr>
<% if left(request("img"),1)="S" then %>
				<tr>
					<td height=30 align=center><font size=2>작은이미지 <INPUT type="file" name=S_image size=30 class="form"></td>
				</tr>
				<tr>
					<td height=30 align=center><FONT color=darkred>(이미지명은 "<%=rs("goods_code")%>_s.확장자"로 변경되어 저장됩니다.<br>화일을 선택하지 않고, 등록완료버튼을 누르면 이미지가 제거됩니다.)</FONT></td>
				</tr>
<% elseif left(request("img"),1)="L" then %>
				<tr>
					<td align=center><font size=2>큰이미지 <INPUT type="file" name=L_image size=30 class="form"></td>
				</tr>
				<tr>
					<td align=center><FONT color=darkred>(이미지명은 "<%=rs("goods_code")%>.확장자"로 변경되어 저장됩니다.<br>화일을 선택하지 않고, 등록완료버튼을 누르면 이미지가 제거됩니다.)</FONT></td>
				</tr>
<% end if %>
			    <tr>
					<td height=30 align=center><input type=submit value="등록완료">&nbsp;&nbsp;&nbsp;<input type=button value=닫기 onclick="self.close();"></td>
			    </tr>
		    </table>
		</tr>
	</td>
</table>
</form>
</body>
</html>