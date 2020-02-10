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
 try
 {

   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");

   String TNAME=request.getParameter("tname");
   
   PreparedStatement st=con.prepareStatement("select CNAME from CUSTOMER c,TRAINER t where t.MID=c.MID and t.TNAME=?;");
  st.setString(1,TNAME);
	ResultSet rs=st.executeQuery();
	
	
		if(rs.next())  
{
String name=rs.getString("CNAME");	
	

out.print("<table>");
out.print("<tr>");
out.print("<td>"+name+"</td>");
out.print("</tr>");

out.print("</table>");
out.print("</br>");
out.print("</br>");
out.print("</br>");

   }
	}catch(SQLException e)
	{
		 out.println("<font face=Century Schoolbook>");
		out.println("<center><h1> Enter valid name...</h1></center>");
		  out.print("<br>");
		  out.print("<br>");
		  
		  out.print("<center><h2>To Try again</h2>");
		  out.print("<br>");
		  out.print("<center><a href='query1.html'><h3>CLICK HERE</h3></a>");
		  out.print("<br>");
		  out.print("<br>");

		  out.print("</font>");
	}
  
 %>
 </body>