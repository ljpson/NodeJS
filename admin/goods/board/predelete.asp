<%
name=Request("name")
page=Request("page")
sp=Request("startpage")
num=Request("num")

set DbCon=Server.CreateObject ("adodb.Connection")
DbCon.Open "7npoint","sa","Ekdelsl"  

SQLString = "SELECT * FROM "&name&" WHERE num="&num
Set Result = DbCon.Execute(SQLString)

subject=Result("subject")
writer=Result("writer")
regdate=Result("regdate")
homepage=Result("homepage")
password=Result("password")

content=Result("content")
'content=Replace(content, "&" , "&amp;")
'content=Replace(content, "<" , "&lt;")
'content=Replace(content, ">" , "&gt;")
content=Replace(content,chr(13),"<br>") 
  
Result.Close
Set Result = Nothing
DbCon.Close
Set DbCon = Nothing
%>

<html>
<head><title> <%=num%>�� �� �����ϱ�</title></head>

<script LANGUAGE="JavaScript">
<!--
function yshFocus() {
	document.form1.password.focus();
}
-->
</script>
<style type="text/css">
<!--
.font9 {  font-size: 9pt; font-family: "����", "Verdana", "sans-serif"}

A:visited {
	font-family : "����", "Verdana", "sans-serif";
	font-size: 9pt;
	color: #333399;
	text-decoration: none;
}

A:hover {
	font-family: "����", "Verdana", "sans-serif";
	font-size: 9pt;
	color:#009AFF;
	text-decoration: underline;
}

A:active {  
	font-family : "����", "Verdana", "sans-serif";
	font-size: 9pt;
	color: #333399;
	text-decoration: none;
} 

A:link {  
	font-family : "����", "Verdana", "sans-serif";
	font-size: 9pt;
	color: #333399;
	text-decoration: none;
} 
 -->
</style>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="yshFocus()">
<basefont size="2" face="����">
<table border="0" cellpadding="0" cellspacing="0" width="700" align=center>
    <tr>
        <td valign="top" align=center>
			<table border=0 cellspacing=0 cellpadding=0 width=500 align=center>
				<tr>
					<td height=50 align=center><b>��ǰ����/���Ұ�</b></td>
				</tr>
			</table>
			<table border=0 cellspacing=0 cellpadding=0 width=500 align=center>
				<tr>
					<td width=110><img src="./images/board_top.gif"></td>
					<td width=390 background="./images/board_back.gif" align="center"><p class="font9"><font color="#c71585"><b>�Խù� �����ϱ�</b></font></td>
					<td width=24 background="./images/board_back.gif" align="right"><a href="board.asp?name=<%=name%>&page=<%=page%>&startpage=<%=startpage%>"><img src="./images/list.gif" border="0" alt="list"></a></td>
					<td width="6"><img src="./images/board_end.gif"></td>
				</tr>
			</table>
			<table width=500 border="0" cellpadding="1" cellspacing=1>
			<form method="post" name="form1" action="delete.asp">
				<input type="hidden" name="name" value="<%=name%>">
				<input type="hidden" name="page" value="<%=page%>">
				<input type="hidden" name="startpage" value="<%=sp%>">
				<input type="hidden" name="num" value="<%=num%>">
				<tr bgcolor="#f0e68c">
					<td align="center"><p class="font9"><font color="#dc143c">���� :<%=subject%></font></td>
				</tr>
				<tr bgcolor="#fdf5e6">
					<td align="center">
						<font color="#808080" size="2">��ȣ:</font><font color="#0000ff" size="2"><%=num%></font>&nbsp;
						<font color="#808080" size="2">�ۼ���:</font><font color="#000000" size="2"><b><%=writer%></b></a></font>&nbsp;
						<font color="#808080" size="2">�ۼ���:</font><font color="#000000" size="2"><%=regdate%></font>&nbsp;
					</td>
				</tr>
				<%if Trim(homepage) <> ""  then%>
				<tr bgcolor="#B0E0E6">
					<td align=center>
						<font size=2>Ȩ������ : http://<%=homepage%></font>
					</td>
				</tr>
				<%end if%>
				<tr bgcolor="#ffffff">
					<td>
						<table width=360 align=center border=0>
							<tr>
								<td><font color="#000000" size="2"><br><%=content%><br><br></font></td>
							</tr>
						</table>
					</td>
				</tr>
				<%'if Trim(uploads) <> ""  then%>
				<!--
				<tr bgcolor="#ffffe0">
					<td align=center>
						<font size=-1>÷������ : <a href="ftp://147.46.234.124/bulletin_upload/<%'=uploads%>"><%'=uploads%></a></font>
					</td>
				</tr>
				-->
				<%'end if%>
				<tr bgcolor="#fff0f5">
					<th><font size="-1">��й�ȣ: <input type="password" name="password" size="8" maxlength="8"> <%=password%> </font></th>
				</tr>
				<tr>
					<td colspan="2" align="center" height="30">
						<font size="-1" color="red"><%=session("deletemsg")%><%session("deletemsg") = ""%>&nbsp;</font>
					</td>
				</tr>
				<tr>
					<td align=center><input type="submit" value="�����ϱ�"></td>
				</tr>
			</form>
			</table>
<!--#include file=copyright.son-->			
		</td>
	</tr>
</table>
</body>
</html>
