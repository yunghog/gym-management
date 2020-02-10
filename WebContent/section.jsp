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
String SNAME=request.getParameter("sname");  
String sd=request.getParameter("sid");  
String nfe=request.getParameter("nofe");  

int SID=Integer.parseInt(sd);
int N0_OF_EQUIPMENTS=Integer.parseInt(nfe);


   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into GYM_SECTION values(?,?,?)");  

   ps.setString(1,SNAME);  
   ps.setInt(2,SID);  
   ps.setInt(3,N0_OF_EQUIPMENTS); 
  
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("<center><h1><font face=Century Schoolbook> You are successfully registered </font></h1>");
 out.print("<br>");
 out.print("<br>");
 
 out.print("<center><h2><font face=Century Schoolbook>To Insert Again</font></h2>");
 out.print("<br>");
 out.print("<center><a href='GymSection.html'><h3>CLICK HERE</h3></a>");
 out.print("<br>");
 out.print("<br>");
 
 out.print("<center><h2><font face=Century Schoolbook>To Choose Other Tables</font></h2>");
 out.print("<br>");
 out.print("<center><a href='insert.html'><h3>CLICK HERE</h3></a>");
  }
  else{
	  out.print("<font face=Century Schoolbook>You are NOT successfully registered  !!!!</font>"); 
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><h2>To Try again</h2>");
	  out.print("<br>");   
out.print("<center><a href='GymSection.html'><h3>TRY AGAIN</h3></a>");
out.print("<br>");
out.print("<br>");

out.print("<center><h2>To choose other Tables</h2>");
out.print("<br>");
out.print("<center><a href='insert.html'><h3>CLICK HERE</h3></a>");
  }
}catch(Exception e)
{
	
	out.println("<center><h1><font face=Century Schoolbook> Oops Values are not proper  !!!   Insert proper values...</font></h1></center>");
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><h2><font face=Century Schoolbook>To Try again</font></h2>");
	  out.print("<br>");
	  out.print("<center><a href='GymSection.html'><h3>CLICK HERE</h3></a>");
	  out.print("<br>");
	  out.print("<br>");

	  out.print("<center><h2><font face=Century Schoolbook>To go back to choose other Tables</font></h2>");
	  out.print("<br>");
	  out.print("<center><a href='insert.html'><h3>CLICK HERE</h3></a>");
}
    %> 
</body>
</html>