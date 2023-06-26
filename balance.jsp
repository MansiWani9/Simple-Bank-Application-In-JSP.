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
	PreparedStatement stat=con.prepareStatement("select Balance from useraccount where AccNo=?");
	stat.setString(1,request.getParameter("t1"));
	ResultSet rs=stat.executeQuery();
	if(rs.next())
		out.println("<h1>Current Balance="+rs.getInt(1)+"</h1>");
	else
		out.println("<h2>Account not found</h2>");
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