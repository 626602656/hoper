<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������4</title>
</head>

<body onload="jss();">
<p>
�Ƽ���С����
</p>
<%
if request.Cookies("user")="" then
sql="insert into us(us) values('"&now()&"')"
'response.Write sql
conn.execute(sql)
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from us",conn,1,1
response.Cookies("user")="�ο�"&rs.recordcount+1
rs.close
end if
%>
<p>
  <Script language="javascript" src="js.js"></script>
״̬��<span id="zt"></span><br />
<br />
<textarea name="textarea" id="textarea" onpropertychange="this.scrollTop=this.scrollHeight" onfocus="this.scrollTop=this.scrollHeight"  readonly="readonly" cols="60" rows="20" ></textarea>
  <br />
  ���֣�
  <input type="text" name="us" id="us" value="<%=request.Cookies("user")%>" />
  <br />
  <input name="t" type="text" id="t" onkeydown="if(event.keyCode==13) jsc();" size="60"/>
  <input type="button" onclick="jsc();" name="button" id="button" value="����" />
  <!--<input type="button" name="button2" id="button2" onclick="cclse()" value="����" />-->
  <input type="button" name="button2" id="button2" onclick="cclse()" value="����" />
</p>
<div id="tt"></div>

</body>
</html>
