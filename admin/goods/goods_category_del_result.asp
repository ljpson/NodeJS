<%
page=request("page")
startpage=request("startpage")
goods_idx=request("goods_idx")
re=request("re")
goods_code=request("goods_code")
goods_category=request("goods_category")
first_code=left(goods_category,2)
second_code=mid(goods_category,3,2)
third_code=right(goods_category,2)

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

sql="delete from goods_category where goods_code='"&goods_code&"' and goods_category='"&goods_category&"'"
Conn.Execute(sql)

	if not first_code="00" then
		sqlupdate1="update goods_first set first_qty=first_qty-1 where first_code='"&first_code&"'"
		Conn.Execute(sqlupdate1)
	end if
	if not second_code="00" then
		sqlupdate2="update goods_second set second_qty=second_qty-1 where first_code='"&first_code&"' and second_code='"&second_code&"'"
		Conn.Execute(sqlupdate2)
	end if
	if not third_code="00" then
		sqlupdate3="update goods_third set third_qty=third_qty-1 where first_code='"&first_code&"' and second_code='"&second_code&"' and third_code='"&third_code&"'"
		Conn.Execute(sqlupdate3)
	end if

Conn.Close
set Conn = nothing

Response.Redirect("goods_"&re&".asp?page="&page&"&startpage="&startpage&"&goods_idx="&goods_idx)
%>