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
   String query2="select * from TRAINER";
   Statement st2=con.createStatement();
   ResultSet rs2=st2.executeQuery(query2);
   out.print("<font face=Century Schoolbook>");
   out.print("<h2><u>Trainer Details</u></h2>");
   

	 

  	out.print("	<center><table  border=2><tr><td><h2>TNAME</h2></td><td><h2>TID</h2></td><td><h2>ADDRESS</h2></td><td><h2>PHONE</h2></td><td><h2>SID</h2></td></tr>");
	while(rs2.next())  
{
String name=rs2.getString("TNAME");	
int mid=rs2.getInt("MID");
String add=rs2.getString("ADDRESS");
int ph=rs2.getInt("PHONE");
int sid=rs2.getInt("SID");	

out.print("<tr>");
out.print("<td><h3>"+name+"</h3></td>");
out.print("<td><h3> "+mid+"</bh3></td>");
out.print("<td><h3>"+add+"</h3></td>");
out.print("<td><h3>"+ph+"</h3></td>");
out.print("<td><h3> "+sid+"</bh3></td>");
out.print("</tr>");
  }
	out.print("</table>");
	out.print("<br>");
	out.print("<a href='see.html'><b><h2 color=black >Go Back</h2></b></a>");
%>
</body>
</html>