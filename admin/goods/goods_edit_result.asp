<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

	goods_code = request("goods_code")
	capacity = request("capacity")
	if capacity="무한" then
		capacity=9999999
	end if
	goods_name=request("goods_name")
	
sql="update goods_info set goods_name='"&goods_name&"',goods_size='"&request("goods_size")&"',goods_type='"&request("goods_type")&"',goods_price="&_
	request("goods_price")&",goods_discount_price="&request("goods_discount_price")&",award_amount="&request("award_amount")&",S_content='"&_
	request("S_content")&"',L_content='"&request("L_content")&"',sale_type='"&request("sale_type")&"',capacity="&capacity&" where goods_code='"&goods_code&"'"

Conn.Execute(sql)

	Set Connmdb = Server.CreateObject ("ADODB.Connection")
	Connmdb.Open ("serviceMDB")

	sqlselect="select * from goods where goods_code='"&goods_code&"'"
	set rsselect = Connmdb.Execute(sqlselect)

	if not rsselect.eof then

		if request("goods_type")="1" then
			goods_price=request("goods_price")
		elseif request("goods_type")="2" then
			goods_price=request("goods_discount_price")
		end if

	sqlinsert="update goods set goods_name='"&request("goods_name")&"["&request("goods_size")&"]"&"',goods_price="&goods_price&",token_amount="&request("award_amount")&",token_amount_g="&request("award_amount")&" where goods_code='"&goods_code&"'"

	Connmdb.Execute(sqlinsert)

	end if

	Connmdb.Close
	set Connmdb = nothing
%>


<HTML>
<HEAD>
<TITLE></TITLE>
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
	.form {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
	.font9 {  font-size: 10pt; font-family: "굴림체", "Verdana", "sans-serif"}
//-->
</style>
<BODY>
<BR>
<BR>
<table width=700 cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td align=center height=400>
		<table width=500 cellpadding=5 cellspacing=3 bgcolor="#EEEECC">
			<tr>
				<td align=center height=200 valign=middle class="font9" colspan=2>
					정상적으로 수정되었습니다!! <BR>
					상품목록에서 확인하시고,<br> 잘못 기입된 부분이 있으면 수정해 주세요!!
					<br><br>
					<table align=center>
						<tr>
							<td align=center class="font9"><INPUT type=button value="메인화면" class=form style="CURSOR: hand" onclick="location.replace('../default.asp');"></td>
							<td><INPUT type=button value="이전화면으로" class=form style="CURSOR: hand" onclick="javascript:history.back(-1);"></td>
							<td><input type=button  value="상품목록" class=form style="CURSOR: hand" onclick="location.replace('goods_list.asp?page=<%=page%>&startpage=<%=startpage%>');"></td>
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
<%
Conn.Close
set Conn = nothing
%>