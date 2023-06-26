<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db2","root","Mansi@123");
	PreparedStatement stat=con.prepareStatement("select * from useraccount where UserID=? and Password=?");
	stat.setString(1,request.getParameter("t1"));
	stat.setString(2,request.getParameter("t2"));
	ResultSet rs=stat.executeQuery();
	if(rs.next())
	{
	%>
	<form method="post" action="balance.jsp">
	Account No<input type="text" name="t1"><br>
	<input type="submit" value ="submit">
	</form>
	<%
	}
	else
	
		out.println("<h1>login failed</h1>");	
	rs.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>


</body>
</html>