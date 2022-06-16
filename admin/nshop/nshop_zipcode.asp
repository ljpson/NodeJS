<html>
<head>
<title>우편번호 검색</title>
</head>
<script language=javascript>
<!--
  function win_focus(){
    window.focus();
    document.frm.schar.focus();
  }
//-->
</script>
<style TYPE="text/css">
<!--
     .formstyle1 {Font-Family:Arial,굴림; Font-Size:10pt; Background-Color:#FFFFDD; Color:black; Border:1sx SOLID BLACK}
     .formstyle2 {Font-Family:Arial,굴림; Font-Size:10pt; Background-Color:#CCCCCC; Color:black; Border:1sx SOLID BLACK}	

     A:link {font-size: 10pt; text-decoration:none; Color:darkgreen}
     A:hover {font-size: 10pt; text-decoration:none; Color:#FF0000; background-color:#FFFFFF}
     A:active {font-size: 10pt; text-decoration:none; Color:#00FF00}
     A:visited {font-size: 10pt; text-decoration:none; Color:#2A5C66}
	
-->
</style>
<body bgcolor="#f4f4E5" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000" onload="win_focus();">
<script language="javascript">
<!--
function setopenerdata(pc1,pc2,addr,ad1,ad2){
  opener.document.reg.zip1.value = pc1;
  opener.document.reg.zip2.value = pc2;
  opener.document.reg.addr1.value = addr;
  opener.document.reg.zip1_d.value = pc1;
  opener.document.reg.zip2_d.value = pc2;
  opener.document.reg.addr1_d.value = addr;

  if(opener.document.reg.addr2 == null){
    opener.document.reg.addr1.focus();
  }else{
    opener.document.reg.addr2.focus();
  }    
  this.close();
}
//-->
</script>
<center><br>
<form method="get" name=frm action="<%=sScript%>">
<table border=0><tr><td><font size=2 face=굴림>기억하시는 자택 주소나 우편번호를 넣으세요.</font></td>
<td><input type="text" name="schar" value="<%=request.querystring("schar")%>" size="12" class=formstyle1></td>
<td><input type="submit" value="찾기" class=formstyle2></td></tr></table>
</form>
<font size=2 face=굴림>ex) "역삼" or "135"</font>
<hr width="420" border=1 color=teal>
<%
	sScript = Request.ServerVariables("SCRIPT_NAME")
	'Response.Write sScript

	if request.queryString("page") = "" then 
		NowPage = 1  
	else 
		NowPage = Cint(request.queryString("page"))
	end if

	if Request.QueryString("schar") <> "" then
	
    	'set DbCon = Server.CreateObject("ADODB.Connection")
	'DbCon.Open("DSN=ff;UID=ffchoi;PWD=ffblue")
	'DbCon.Open("post_p")

	set DbCon=Server.CreateObject ("adodb.Connection")
	DbCon.Open "7npoint","sa","Ekdelsl"  

		SQL = "SELECT post.postNumber, post_large.largeName, post_mid.midName, post_small.smallName, post.postName "
		SQL = SQL & "FROM ((post_large INNER JOIN post_mid ON post_large.largeID = post_mid.largeID) "
		SQL = SQL & "INNER JOIN post_small ON (post_mid.midID = post_small.midID) AND (post_mid.largeID = post_small.largeID)) "
		SQL = SQL & "INNER JOIN post ON (post_large.largeID = post.largeID) AND (post_small.smallID = post.smallID) AND (post_small.midID = post.midID) AND (post_small.largeID = post.largeID) "
		SQL = SQL & "where 	post.postname like '%" & Request.QueryString("schar") & "%' "
		SQL = SQL & "or post_small.smallname like '%" & Request.QueryString("schar") & "%' "	
		SQL = SQL & "or post_mid.midname like '%" & Request.QueryString("schar") & "%' "
		SQL = SQL & "or post_large.largename like '%" & Request.QueryString("schar") & "%' "
		SQL = SQL & "or post.postNumber like '" & Request.QueryString("schar") & "%' "
				
		set Dcom = DbCon.Execute(SQL)
		
		if Dcom.BOF and Dcom.EOF then
			response.write "검색된 결과가 없습니다."
			Dcom.close() : set Dcom = Nothing : set DbCon = Nothing
			Response.end
		end if
		Dcom.close()
		
    Set Dcom = Server.CreateObject("ADODB.Recordset")
    Dcom.Pagesize = 10
    Dcom.Open SQL,DbCon,1
    Dcom.AbsolutePage = NowPage
    EndPage = Cint(Dcom.PageCount)
%>
<table border="0" cellpadding=2 cellspacing=1>
<tr bgcolor="#aaccaa"><td align=left colspan=2><font size=2 face=돋움 color=black>검색어:<font size=2 face=돋움 color=darkgreen>"<b><%=request.querystring("schar")%></b>"</font>
&nbsp;&nbsp;찾은갯수:<font size=2 face=돋움 color=darkgreen><b><%=Dcom.recordcount%></b></font></td><td align=right><font size=2 face=돋움 color=darkgreen><b><%=NowPage%>/<%=Endpage %></b><font size=2 face=돋움 color=darkblue>Pages</font></td></tr>
<%
  i = 1
  Do until Dcom.EOF or i>Dcom.PageSize
%>
<tr bgcolor="#eef1e3">
<td width="60" align=center><font size=2 face=돋움 color=darkred><b><%=Left(Dcom("postNumber"),3)%>-<%=right(Dcom("postNumber"),3)%></b></font></td>
<td width="280"><nobr><font size=2 face=돋움 color=black><%=Trim(Dcom("LargeName"))%>&nbsp;<%=Trim(Dcom("midName"))%>&nbsp;<%=Trim(Dcom("SmallName"))%>&nbsp;<%=Trim(Dcom("postName"))%></font></nobr></td>
<td width="60"align=center><font size=2 face=돋움 color=darkgreen><a href="javascript:setopenerdata('<%=Left(Dcom("postNumber"),3)%>','<%=right(Dcom("postNumber"),3)%>','<%=Trim(Dcom("LargeName"))&" "&Trim(Dcom("midName"))&" "&Trim(Dcom("SmallName"))&" "&Trim(Dcom("postName")) %>','<%=Trim(Dcom("LargeName"))%>','<%=Trim(Dcom("midName"))%>')">사용</a></font></td>
</tr>
<%

    I = I + 1
	Dcom.MoveNext
   Loop

   End If
%>
<tr bgcolor="#aaccaa"><td colspan="3" align=right><font size=2 face=돋움 color=green>
<% if Cint(Nowpage) > 1 then  %>
<a href="<%=sScript%>?schar=<%=Server.URLEncode(request.querystring("schar"))%>&page=1"><<처음</a>
<% end if %>
<% if Cint(Nowpage) > 1 then  %>
<a href="<%=sScript%>?schar=<%=Server.URLEncode(request.querystring("schar"))%>&page=<%=Nowpage-1%>"><이전</a>
<% end if %>
<% if Cint(EndPage) > Cint(Nowpage) then  %>
<a href="<%=sScript%>?schar=<%=Server.URLEncode(request.querystring("schar"))%>&page=<%=Nowpage+1%>">다음></a>
<% end if %>
<% if Cint(EndPage) > Cint(Nowpage) then  %>
<a href="<%=sScript%>?schar=<%=Server.URLEncode(request.querystring("schar"))%>&page=<%=EndPage%>">끝>></a>
<% end if %>
</font></td></tr>
</table>
<%
  'Dcom.Close
  set Dcom = Nothing
  'DbCon.Close
  set DbCon = Nothing
%>
<hr width="420" border=1 color=teal>
</center>
</body>
</html>
