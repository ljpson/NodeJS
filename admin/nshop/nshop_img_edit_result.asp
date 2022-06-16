<%
set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

Set uploadform = Server.CreateObject("SiteGalaxyUpload.Form")
set fso=Server.CreateObject("Scripting.FileSystemObject")

	nshop_code = uploadform("nshop_code")
	FilePath="D:/Inetpub/wwwroot/npoint/images/shop/"


if left(uploadform("img"),1)="S" then
		session("upload")="삭제"
	original_logo_img = uploadform("img_logo")
	if original_logo_img <> "" then
		new_logo_img=nshop_code & "_l" & right(original_logo_img,4)
		uploadform("img_logo").SaveAs(FilePath & new_logo_img)
		session("upload")="등록"
	end if

	sql="update nshop_info set img_logo='"&new_logo_img&"' where nshop_code='"&nshop_code&"'"

elseif left(uploadform("img"),1)="L" then
		session("upload")="삭제"
	original_main_img = uploadform("img_main")
	if original_main_img <> "" then
		new_main_img=nshop_code & "_m" & right(original_main_img,4)
		uploadform("img_main").SaveAs(FilePath & new_main_img)
		session("upload")="등록"
	end if
	
	sql="update nshop_info set img_main='"&new_main_img&"' where nshop_code='"&nshop_code&"'"

end if

set result=Conn.Execute(sql)
%>


<HTML>
<HEAD>
<TITLE>[NSHOP] 관리자툴 - 업체(NSHOP)이미지등록</TITLE>
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