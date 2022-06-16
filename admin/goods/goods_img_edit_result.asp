<%
set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

Set uploadform = Server.CreateObject("SiteGalaxyUpload.Form")
set fso=Server.CreateObject("Scripting.FileSystemObject")

	nshop_code=uploadform("nshop_code")
	goods_code = uploadform("goods_code")
	FilePath="D:/Inetpub/wwwroot/npoint/images/goods/"&nshop_code&"/"


if left(uploadform("img"),1)="S" then
		session("upload")="삭제"
	original_S_img = uploadform("S_image")
	if original_S_img <> "" then
		new_S_img=goods_code & "_s" & right(original_S_img,4)
		uploadform("S_image").SaveAs(FilePath & new_S_img)
		session("upload")="등록"
	end if

	sql="update goods_info set S_image='"&new_S_img&"' where goods_code='"&goods_code&"'"

elseif left(uploadform("img"),1)="L" then
		session("upload")="삭제"
	original_L_img = uploadform("L_image")
	if original_L_img <> "" then
		new_L_img=goods_code & right(original_L_img,4)
		uploadform("L_image").SaveAs(FilePath & new_L_img)
		session("upload")="등록"
	end if
	
	sql="update goods_info set L_image='"&new_L_img&"' where goods_code='"&goods_code&"'"

end if

set result=Conn.Execute(sql)
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
<script>
opener.location.reload()
</script>
<BODY leftmargin=0 topmargin=0>
<table width=400 cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td align=center height=160>
		<table width=400 cellpadding=5 cellspacing=3 bgcolor="#EEEECC" height=200>
			<tr>
				<td align=center valign=middle class="font9" colspan=2>
					이미지가 정상적으로 <%=session("upload")%>되었습니다!! <BR>
					<br><br>
					<table align=center>
						<tr>
							<td align=center class="font9"><input type=button value=닫기 onclick="self.close();" id=button1 name=button1></td>
						</tr>
					</table>
				</td>
			</tr>		
		</table>
		</td>
	</tr>
</table>
</BODY>
</HTML>
<%
Conn.Close
set Conn = nothing
%>