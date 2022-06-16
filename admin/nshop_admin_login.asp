<%
  admin_id=Replace(trim(Request("admin_id")),"'", "''")
  admin_passwd=Replace(trim(Request("admin_passwd")),"'", "''")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"

	sql="select * from nshop_info where nshop_code='"&admin_id&"'"
	set rs = Conn.Execute(sql)
	
	if rs.eof then
	
	session("admin_loginmsg")="등록되지 않은 nShop입니다.<br>업체코드를 확인하시고, 다시 로그인 해주세요!!"
	Response.Redirect "default.asp"

	else

			if Request("admin_passwd")=rs("nshop_passwd")  then
				session("nshop_id")=admin_id
				session("nshop_idx")=rs("nshop_idx")
				session("nshop_ename")=rs("nshop_ename")
				Response.Redirect "default.asp"
			else
				session("admin_loginmsg")="비밀번호가 다릅니다"
				Response.Redirect "default.asp"	    
			end if

	end if
%>
<!--
<SCRIPT LANGUAGE=javascript>
    alert ("id나 비밀번호가 틀렸습니다.\n\n비밀번호를 잊어버렸거나 아직 회원가입을 하지 않으신분은\n\n상단메뉴의 회원가입을 눌러주세요!!.");
	javascript:window.history.back(1);    
</SCRIPT>  
-->