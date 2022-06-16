<html>
<head><title>[nShop] 관리자툴 - 초기화면 </title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<style type="text/css">
<!--

    A:link    {font: 10pt 굴림체,Arial;  COLOR: "#004080"; text-decoration: none;}
	A:active  {font: 10pt 굴림체,Arial;  COLOR: "#0000A0"; text-decoration: none;}
    A:visited {font: 10pt 굴림체,Arial;  COLOR: "#006699"; text-decoration: none;}
    A:hover   {font: 10pt 굴림체,Arial;  color: red; text-decoration:underline;}');
       
	.font9 {  font-size: 10pt; font-family: "굴림체", "Verdana", "sans-serif"}   

	.font8 {  font-size: 9pt; font-family: "굴림", "Verdana", "sans-serif"}

	.tdcont {line-height:150%;text-align:justify;font-size:9pt;}
	.form {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt 굴림; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
    
-->
</style>
<SCRIPT LANGUAGE="JAVASCRIPT">
<!--
         function check_len() 
          {
               if (document.reg.admin_id.value == "" ) {
  		   alert("관리자 ID를 입력하십시오 ");
 		   document.reg.admin_id.focus();
 		   return false;
		}
               if (document.reg.admin_passwd.value == "" ) {
  		   alert("비밀번호를 입력하십시오 ");
 		   document.reg.admin_passwd.focus();
 		   return false;
		}
           }
// -->
</SCRIPT> 

<% if session("nshop_id")="" then %>
<body bgcolor="#ffffff" onload="document.reg.admin_id.focus();">
<center>
<form action="nshop_admin_login.asp" method=post  name="reg" onSubmit="return check_len(this)">
<table width=700>
	<tr>
		<td align=center>
			<table width=300 cellpadding=1 cellspacing=0>
				<tr>
					<td align=center><br><br><font size=2 color="000000"><b>NSHOP 관리자 로그인 </b></font><br><Br><br><Br></td>
				</tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=300 cellpadding=2 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td><font size=2>업체코드</td>
								<td><input type=text name=admin_id size=10 maxlength=10 class="form"></td>
							</tr>
							<tr>
								<td><font size=2>비밀번호</td>
								<td><input type=password name=admin_passwd size=10 maxlength=10 class="form"></td>
							</tr>
							<tr>
								<td colspan=4 align=center>
								<input type=submit value=확인>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset  value=다시작성></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><br><font size=2><%=session("admin_loginmsg")%><%session("admin_loginmsg")=""%></font>
		</td>
	</tr>
</table>
</form>

<% else %>
<body bgcolor="#ffffff">
<center>
<table border=0 cellpadding=2 cellspacing=0 bgcolor=teal width=500 align=center>
	<tr>
		<td align=middle><br><font color=white><b>nShop 관리자모드</b></font><br><br>
			<table border=0 cellpadding=8 cellspacing=0 bgcolor=#efefef width=100%>
				<tr>
					<td align=center valign=top>
						<table>
							<tr>
								<td class=font9 valign=top><br><br>
						            <ol>
										<li>업체 관리</li> <p>
											<ul>
<!--												<li class=font8>업체 카테고리<font color=darkred></font><BR></li>
													<a href="#">카테고리 전체보기</a><br>
													<a href="#">카테고리 검색</a><br><br>-->
						      					<li class=font8>업체정보<font color=darkred></font><BR></li>
						      						<a href="nshop/nshop_detail.asp?nshop_idx=<%=session("nshop_idx")%>">업체정보 수정</a><br>
						      						<a href="nshop/nshop_passwd_edit.asp?nshop_idx=<%=session("nshop_idx")%>">비밀번호 수정</a><br><br>
						      					<li class=font8>업체소식(공지사항/이벤트)<font color=darkred></font><BR></li>
						      						<a href="nshop/nshop_news_input.asp">관련글 등록</a><br>
						      						<a href="nshop/nshop_news_list.asp">관련글 보기/수정/삭제</a><br><br>
						      					<li class=font8>업체광고신청<font color=darkred></font><BR></li>
						      						<a href="nshop/nshop_ad_input.asp">광고신청</a><br>
						      						<a href="nshop/nshop_ad_list.asp">신청된 광고 보기/수정/삭제</a><br>
											</ul>
					<p></p>
										<li>상품 관리</li> <p>
											<ul>
<!--												<li class=font8>상품 카테고리<font color=darkred></font><BR></li>
													<a href="#">카테고리 전체보기</a><br>
													<a href="#">카테고리 검색</a><br><br>-->
						      					<li class=font8>상품정보<font color=darkred></font><BR></li>
						      						<a href="goods/goods_input.asp">상품정보 등록</a><br>
						      						<a href="goods/goods_list.asp">상품정보 보기/수정/삭제</a><br>
						      						<a href="goods/goods_del_list.asp">삭제된 상품보기/복귀</a><br><br>
						      					<li class=font8>제품사용소감 및 제품문의<font color=darkred></font><BR></li>
						      						<a href="goods/board/board.asp">상품문의게시판</a><br>
											</ul>
					<p></p>
										<li> 주문 관리</li> <p>
											<ul>
												<li class=font8>주문 현황보기<font color=darkred></font><BR></li>
													<a href="shopping/order_list.asp">전체 주문 내역보기 및 처리</a><br>
													<a href="shopping/order_list.asp?state=1">주문내역 -> 배송처리/취소(배송전)</a><br>
													<a href="shopping/order_list.asp?state=2">배송 중 주문내역 -> 배송 완료/취소(배송 후)</a><br>
													<a href="shopping/order_list.asp?state=3">주문 완료 내역 ->취소(배송완료 후)</a><br>
						      					<li class=font8>취소된 주문<font color=darkred></font><BR></li>
						      						<a href="shopping/order_list.asp?state=4">배송전 주문취소내역보기</a><br>
						      						<a href="shopping/order_list.asp?state=5">배송후 주문취소내역보기</a><br>
						      						<a href="shopping/order_list.asp?state=6">반품완료 주문내역보기</a><br><br>
						      				</ul>
					<p></p>
<!--									</ol>
								</td>
							</tr>
						</table>
					</td>
					<td align=center valign=top>
						<table>
							<tr>
								<td class=font9 valign=top>
						            <ol>
										<li>게시판관리</li> <p>
											<ul>



											</ul>
					<p></p>-->
									</ol>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align=middle colspan=2><!--<p class=font8 align=center><font color=darkred>의문나는 점이나
										버그 발생시 전용게시판을 이용하세요!!<br>
										전용게시판은 하루에 3~4번 확인하므로
										보다 빠른 조취를 취할 수 있습니다!!</font></p>--><hr>
						<font size=2>[NPOINT] &amp; [<%=session("nshop_ename")%>] </font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<% end if %>
	</center>
  </body>
</html>