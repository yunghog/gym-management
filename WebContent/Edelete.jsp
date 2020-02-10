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

   String e=request.getParameter("eid");
   int EID=Integer.parseInt(e);
   
   PreparedStatement st=con.prepareStatement("delete from EQUIPMENT where EID=?;");
   st.setInt(1,EID);
   int i=st.executeUpdate();
	if(i>0){
	out.println("<center><h2>One Equipment Details Deleted</h2></center>");
	out.print("<br>");
	out.print("<br>");

	  out.print("<center><a href='query.html'><h3>Go Back To Analysis</h3></a>");
	  out.print("<br>");
	  out.print("<br>");
	  out.print("<center><a href='Edelete.html'><h3>Delete One More<h3></a>");
	  out.print("<br>");
 }
	else{
		out.println("<center><h2>Equipment cannot deleted....</h2></center>");
		  out.print("<br>");
		  out.print("<br>");
		  
		  out.print("<center><a href='delete.html'><h3>Try Again</h3></a>");
		  out.print("<br>");

		  
		  out.print("<br>");
		  out.print("<center><a href='query.html'><h3>Go Back Analysis</h3></a>");	
	}
 }	
 
catch(Exception e)
 {

	out.println("<center><h2>Equipment cannot be deleted....</h2></center>");
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><a href='delete.html'><h3>Try Again</h3></a>");
	  out.print("<br>");

	  
	  out.print("<br>");
	  out.print("<center><a href='query.html'><h3>Go Back Analysis</h3></a>");
 }
%>
 </body>