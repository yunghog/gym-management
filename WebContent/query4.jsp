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
   
   PreparedStatement st=con.prepareStatement("select MNAME,DESCRIPTION from WAREHOUSE w,GYM_SECTION g where g.SID=w.SID and g.SNAME=?;");
  st.setString(1,SNAME);
	ResultSet rs=st.executeQuery();
	
	out.print("<td><h2><u>"+" Medicinal Details   :  </u></h2></td>");
	out.print("</br>");
	
	out.print("	<center><table  border=2><tr><td><h2>MNAME</h2></td><td><h2>DESCRIPTION</h2></td></tr>");
	
	
		while(rs.next())  
{
String name=rs.getString("MNAME");	
	
String des=rs.getString("DESCRIPTION");	

out.print("<tr>");
out.print("<td><h3>"+name+"</h3></td>");

out.print("<td><h3>"+des+"</h3></td>");

out.print("</tr>");

   }
		out.print("</table>");
  
 %>
 </body>