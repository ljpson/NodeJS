<%
page=request("page")
startpage=request("startpage")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

sqlselect="select * from goods_category where goods_code='"&request("goods_code")&"'"
set rsselect = Conn.Execute(sqlselect)

if not rsselect.eof then
	do until rsselect.eof
		first_code=left(rsselect("goods_category"),2)
		second_code=mid(rsselect("goods_category"),3,2)
		third_code=right(rsselect("goods_category"),2)
		
		if not first_code="00" then
			sqlupdate1="update goods_first set first_qty=first_qty+1 where first_code='"&first_code&"'"
			Conn.Execute(sqlupdate1)
		end if
		if not second_code="00" then
			sqlupdate2="update goods_second set second_qty=second_qty+1 where first_code='"&first_code&"' and second_code='"&second_code&"'"
			Conn.Execute(sqlupdate2)
		end if
		if not third_code="00" then
			sqlupdate3="update goods_third set third_qty=third_qty+1 where first_code='"&first_code&"' and second_code='"&second_code&"' and third_code='"&third_code&"'"
			Conn.Execute(sqlupdate3)
		end if
	rsselect.movenext
	loop
end if

set rsselect = nothing

sql="update goods_info set del='Y' where goods_code='"&request("goods_code")&"'"
Conn.Execute(sql)

Conn.Close
set Conn = nothing

Response.Redirect("goods_del_list.asp?page="&page&"&startpage="&startpage)
%>