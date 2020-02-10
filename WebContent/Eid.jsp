<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student_Insert</title>
</head>
<body bgcolor="Pink">
 <%

   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");

   //String TNAME=request.getParameter("tname");
   
   PreparedStatement st=con.prepareStatement("Select EID,ENAME from EQUIPMENT;");
	ResultSet rs=st.executeQuery();
out.print("<center>");	
out.print("<h2>Machine Details :</h2>");
out.print("<br>");
out.print("<br>");
out.print("</center>");
	%>	
	<center>
	<table  border=2>
	<tr>
	<td><h3>MID</h3></td>
     <td><h3>MACHINE_NAME</h3></td>
	</tr>
	
	
	
	<% while(rs.next())  
{%>
<tr>
<td><b><h3><%=rs.getString("EID") %></h3></b></td>
<td><b><h3><%=rs.getString("ENAME") %></h3></b></td>
</tr>
  <%  }
  
 %>
 </table>
 </br>
 </br> 
 <a href='delete.html'><h3>Go Back And Delete </h3></a>
 </center>
 </body>