<html>
<head><title>[nShop] �������� - �ʱ�ȭ�� </title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<style type="text/css">
<!--

    A:link    {font: 10pt ����ü,Arial;  COLOR: "#004080"; text-decoration: none;}
	A:active  {font: 10pt ����ü,Arial;  COLOR: "#0000A0"; text-decoration: none;}
    A:visited {font: 10pt ����ü,Arial;  COLOR: "#006699"; text-decoration: none;}
    A:hover   {font: 10pt ����ü,Arial;  color: red; text-decoration:underline;}');
       
	.font9 {  font-size: 10pt; font-family: "����ü", "Verdana", "sans-serif"}   

	.font8 {  font-size: 9pt; font-family: "����", "Verdana", "sans-serif"}

	.tdcont {line-height:150%;text-align:justify;font-size:9pt;}
	.form {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:1x solid #778899}
	.inkform {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#004cb3; BORDER:1x solid #778899}
	.select {font: 9pt ����; BACKGROUND-COLOR:#FFFFFF; COLOR:#222222; BORDER:0x solid #778899}
    
-->
</style>
<SCRIPT LANGUAGE="JAVASCRIPT">
<!--
         function check_len() 
          {
               if (document.reg.admin_id.value == "" ) {
  		   alert("������ ID�� �Է��Ͻʽÿ� ");
 		   document.reg.admin_id.focus();
 		   return false;
		}
               if (document.reg.admin_passwd.value == "" ) {
  		   alert("��й�ȣ�� �Է��Ͻʽÿ� ");
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
					<td align=center><br><br><font size=2 color="000000"><b>NSHOP ������ �α��� </b></font><br><Br><br><Br></td>
				</tr>
				<tr>
					<td align=center bgcolor="#9999CC">
						<table width=300 cellpadding=2 cellspacing=3 bgcolor="#EEEECC">
							<tr>
								<td><font size=2>��ü�ڵ�</td>
								<td><input type=text name=admin_id size=10 maxlength=10 class="form"></td>
							</tr>
							<tr>
								<td><font size=2>��й�ȣ</td>
								<td><input type=password name=admin_passwd size=10 maxlength=10 class="form"></td>
							</tr>
							<tr>
								<td colspan=4 align=center>
								<input type=submit value=Ȯ��>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset  value=�ٽ��ۼ�></td>
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
		<td align=middle><br><font color=white><b>nShop �����ڸ��</b></font><br><br>
			<table border=0 cellpadding=8 cellspacing=0 bgcolor=#efefef width=100%>
				<tr>
					<td align=center valign=top>
						<table>
							<tr>
								<td class=font9 valign=top><br><br>
						            <ol>
										<li>��ü ����</li> <p>
											<ul>
<!--												<li class=font8>��ü ī�װ�<font color=darkred></font><BR></li>
													<a href="#">ī�װ� ��ü����</a><br>
													<a href="#">ī�װ� �˻�</a><br><br>-->
						      					<li class=font8>��ü����<font color=darkred></font><BR></li>
						      						<a href="nshop/nshop_detail.asp?nshop_idx=<%=session("nshop_idx")%>">��ü���� ����</a><br>
						      						<a href="nshop/nshop_passwd_edit.asp?nshop_idx=<%=session("nshop_idx")%>">��й�ȣ ����</a><br><br>
						      					<li class=font8>��ü�ҽ�(��������/�̺�Ʈ)<font color=darkred></font><BR></li>
						      						<a href="nshop/nshop_news_input.asp">���ñ� ���</a><br>
						      						<a href="nshop/nshop_news_list.asp">���ñ� ����/����/����</a><br><br>
						      					<li class=font8>��ü�����û<font color=darkred></font><BR></li>
						      						<a href="nshop/nshop_ad_input.asp">�����û</a><br>
						      						<a href="nshop/nshop_ad_list.asp">��û�� ���� ����/����/����</a><br>
											</ul>
					<p></p>
										<li>��ǰ ����</li> <p>
											<ul>
<!--												<li class=font8>��ǰ ī�װ�<font color=darkred></font><BR></li>
													<a href="#">ī�װ� ��ü����</a><br>
													<a href="#">ī�װ� �˻�</a><br><br>-->
						      					<li class=font8>��ǰ����<font color=darkred></font><BR></li>
						      						<a href="goods/goods_input.asp">��ǰ���� ���</a><br>
						      						<a href="goods/goods_list.asp">��ǰ���� ����/����/����</a><br>
						      						<a href="goods/goods_del_list.asp">������ ��ǰ����/����</a><br><br>
						      					<li class=font8>��ǰ���Ұ� �� ��ǰ����<font color=darkred></font><BR></li>
						      						<a href="goods/board/board.asp">��ǰ���ǰԽ���</a><br>
											</ul>
					<p></p>
										<li> �ֹ� ����</li> <p>
											<ul>
												<li class=font8>�ֹ� ��Ȳ����<font color=darkred></font><BR></li>
													<a href="shopping/order_list.asp">��ü �ֹ� �������� �� ó��</a><br>
													<a href="shopping/order_list.asp?state=1">�ֹ����� -> ���ó��/���(�����)</a><br>
													<a href="shopping/order_list.asp?state=2">��� �� �ֹ����� -> ��� �Ϸ�/���(��� ��)</a><br>
													<a href="shopping/order_list.asp?state=3">�ֹ� �Ϸ� ���� ->���(��ۿϷ� ��)</a><br>
						      					<li class=font8>��ҵ� �ֹ�<font color=darkred></font><BR></li>
						      						<a href="shopping/order_list.asp?state=4">����� �ֹ���ҳ�������</a><br>
						      						<a href="shopping/order_list.asp?state=5">����� �ֹ���ҳ�������</a><br>
						      						<a href="shopping/order_list.asp?state=6">��ǰ�Ϸ� �ֹ���������</a><br><br>
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
										<li>�Խ��ǰ���</li> <p>
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
					<td align=middle colspan=2><!--<p class=font8 align=center><font color=darkred>�ǹ����� ���̳�
										���� �߻��� ����Խ����� �̿��ϼ���!!<br>
										����Խ����� �Ϸ翡 3~4�� Ȯ���ϹǷ�
										���� ���� ���븦 ���� �� �ֽ��ϴ�!!</font></p>--><hr>
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