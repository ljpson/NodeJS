<%
page=request("page")
startpage=request("startpage")
nshop_idx=request("nshop_idx")
re=request("re")

set Conn=Server.CreateObject ("adodb.Connection")
Conn.Open "7npoint","sa","Ekdelsl"  

sql="delete from nshop_category where nshop_code='"&request("nshop_code")&"' and nshop_category='"&request("nshop_category")&"'"
Conn.Execute(sql)

Conn.Close
set Conn = nothing

Response.Redirect("nshop_"&re&".asp?page="&page&"&startpage="&startpage&"&nshop_idx="&nshop_idx)
%>