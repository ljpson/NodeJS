<%
set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

Set uploadform = Server.CreateObject("SiteGalaxyUpload.Form")
set fso=Server.CreateObject("Scripting.FileSystemObject")
			
	Sel="SELECT max(substring(goods_code,4,5)) from goods_info"
	Set result=Conn.Execute(Sel)

		if result.EOF or isnull(result(0)) then
			maxno=1
		else
			maxno=result(0)+1
		end if

		maxno=cstr(maxno)
		i=5-len(maxno)
		zero=""
		for n=1 to i
			zero="0"&zero
		next

		if left(now(),2)="20" then
			y=mid(now(),3,2)
		else
			y=left(now(),2)
		end if

		goods_code="G"&y&zero&maxno
		nshop_code=uploadform("nshop_code")
'		category=uploadform("first_code")&uploadform("second_code")&uploadform("third_code")
		capacity = uploadform("capacity")
		if capacity="무한" then
			capacity=9999999
		end if

		original_S_img = uploadform("S_image")
		original_L_img = uploadform("L_image")
		FilePath="D:/Inetpub/wwwroot/npoint/images/goods/"&nshop_code&"/"
	
	if original_S_img <> "" then
		new_S_img=goods_code & "_s" & right(original_S_img,4)
		uploadform("S_image").SaveAs(FilePath & new_S_img)
	end if
	if original_L_img <> "" then
		new_L_img=goods_code & right(original_L_img,4)
		uploadform("L_image").SaveAs(FilePath & new_L_img)
	end if
	if uploadform("goods_discount_price") = "" then
		goods_discount_price=uploadform("goods_price")
	else
		goods_discount_price=uploadform("goods_discount_price")
	end if
	
	Ins="insert into goods_info(nshop_code,goods_code,goods_name,goods_size,goods_type,goods_price,goods_discount_price,award_amount,S_content,L_content,S_image,L_image,sale_type,capacity,del) values('"&_
		nshop_code&"','"&goods_code&"','"&uploadform("goods_name")&"','"&uploadform("goods_size")&"','"&uploadform("goods_type")&"',"&_
		uploadform("goods_price")&","&goods_discount_price&","&uploadform("award_amount")&",'"&uploadform("S_content")&"','"&uploadform("L_content")&"','"&_
		new_S_img&"','"&new_L_img&"','"&uploadform("sale_type")&"',"&capacity&",'Y')"
	Conn.Execute(Ins)

	Set Connmdb = Server.CreateObject ("ADODB.Connection")
	Connmdb.Open ("serviceMDB")

	sqlselect="select * from goods where goods_code='"&goods_code&"'"
	set rsselect = Connmdb.Execute(sqlselect)

	if rsselect.eof then

		if uploadform("goods_type")="1" then
			goods_price=uploadform("goods_price")
		elseif uploadform("goods_type")="2" then
			goods_price=uploadform("goods_discount_price")
		end if

	sqlinsert="INSERT INTO goods(goods_code,goods_name,goods_price,token_type,token_amount,token_amount_g,local_token_amount) VALUES ('"&_
			goods_code&"','"&uploadform("goods_name")&"["&uploadform("goods_size")&"]"&"',"&goods_price&",'GLOBAL',"&uploadform("award_amount")&","&uploadform("award_amount")&",0)"

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
<body text="#222222" link="#004cb3" vlink="#b300a9" alink="#ca2204">
<BR>
<BR>
<table width=700 cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td align=center height=400>
		<table width=500 cellpadding=5 cellspacing=3 bgcolor="#EEEECC">
			<tr>
				<td align=center height=200 valign=middle class="font9">
					정상적으로 입력되었습니다!! <BR><BR>
					<font color=darkred>[상품목록]</font>에서 확인하시고,<br> 잘못 기입된 부분이 있으면 수정해 주세요!!
					<br><br>지금 상품<font color=darkblue>[<%=uploadform("goods_name")%>]</font>의 카테고리 등록을 하시려면,<br><font color=darkred>[카테고리등록]</font> 버튼을 누르세요!!<br><br>
					<table align=center>
						<tr>
							<td align=center class="font9"><INPUT type="submit" value="메인화면" class=form style="CURSOR: hand" onclick="location.replace('../npoint_admin.asp');" id=submit1 name=submit1></td>
							<td><input type=button  value="카테고리등록" class=form style="CURSOR: hand" onclick="window.open('goods_category_input.asp?goods_code=<%=goods_code%>&st=input', 'category_input', 'width=400,height=160') ;" id=button1 name=button1></td>
							<td><input type=button  value="상품목록" class=form style="CURSOR: hand" onclick="location.replace('goods_list.asp?sort=goods_idx');" id=button1 name=button1></td>
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