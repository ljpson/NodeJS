<%
  admin_id=Replace(trim(Request("admin_id")),"'", "''")
  admin_passwd=Replace(trim(Request("admin_passwd")),"'", "''")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"

	sql="select * from nshop_info where nshop_code='"&admin_id&"'"
	set rs = Conn.Execute(sql)
	
	if rs.eof then
	
	session("admin_loginmsg")="��ϵ��� ���� nShop�Դϴ�.<br>��ü�ڵ带 Ȯ���Ͻð�, �ٽ� �α��� ���ּ���!!"
	Response.Redirect "default.asp"

	else

			if Request("admin_passwd")=rs("nshop_passwd")  then
				session("nshop_id")=admin_id
				session("nshop_idx")=rs("nshop_idx")
				session("nshop_ename")=rs("nshop_ename")
				Response.Redirect "default.asp"
			else
				session("admin_loginmsg")="��й�ȣ�� �ٸ��ϴ�"
				Response.Redirect "default.asp"	    
			end if

	end if
%>
<!--
<SCRIPT LANGUAGE=javascript>
    alert ("id�� ��й�ȣ�� Ʋ�Ƚ��ϴ�.\n\n��й�ȣ�� �ؾ���Ȱų� ���� ȸ�������� ���� �����ź���\n\n��ܸ޴��� ȸ�������� �����ּ���!!.");
	javascript:window.history.back(1);    
</SCRIPT>  
-->