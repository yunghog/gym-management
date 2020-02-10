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

   String SNAME=request.getParameter("sname");
   
   PreparedStatement st=con.prepareStatement("select ENAME from EQUIPMENT e,GYM_SECTION g where e.SID=g.SID and g.SNAME=?;");
  st.setString(1,SNAME);
	ResultSet rs=st.executeQuery();
	

		while(rs.next())  
{
String name=rs.getString("ENAME");	
	

out.print("<table>");
out.print("<tr>");
out.print("<h3>");
out.print("<td>"+name+"</td>");
out.print("</tr>");
out.print("</h3>");
out.print("</table>");
out.print("</br>");



   }
  
 %>
 </body>