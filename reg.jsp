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
		PreparedStatement stat=con.prepareStatement("insert into useraccount values(?,?,?,?,?)");
		stat.setString(1,request.getParameter("t1"));
		stat.setString(2,request.getParameter("t2"));
		stat.setString(3,request.getParameter("t3"));
		stat.setInt(4,Integer.parseInt(request.getParameter("t4")));
		stat.setInt(5,Integer.parseInt(request.getParameter("t5")));
		stat.executeUpdate();
		out.println("<h1>Account Opened Successfully</h1>");
		con.close();
}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>