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
String n=request.getParameter("pay_no");  
String p=request.getParameter("amt");  
String e=request.getParameter("cid");  


int PAY_NO=Integer.parseInt(n);
int AMOUNT=Integer.parseInt(p);
int CID=Integer.parseInt(e);



   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into PAYMENT values(?,?,?)");  

	ps.setInt(1,PAY_NO);  
	ps.setInt(2,AMOUNT);  
	ps.setInt(3,CID); 
	  
  
  int i=ps.executeUpdate();
  if(i>0)
  {
	  out.println("<font face=Century Schoolbook>");
 out.print("<center><h1>You are successfully registered  </h1>");
 out.print("<br>");
 out.print("<br>");
 
 out.print("<center><h2>To Insert Again</h2>");
 out.print("<br>");
 out.print("<center><a href='Payment.html'><h3>CLICK HERE</h3></a>");
 out.print("<br>");
 out.print("<br>");
 
 out.print("<center><h2>To Choose Other Tables</h2>");
 out.print("<br>");
 out.print("<center><a href='insert.html'><h3>CLICK HERE</h3></a>");
 out.println("</font>");
  }
  else{
	  out.println("<font face=Century Schoolbook>");
	  out.print("You are NOT successfully registered  !!!!"); 
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><h2>To Try again</h2>");
	  out.print("<br>");   
out.print("<center><a href='Payment.html'><h3>TRY AGAIN</h3></a>");
out.print("<br>");
out.print("<br>");

out.print("<center><h2>To choose other Tables</h2>");
out.print("<br>");
out.print("<center><a href='insert.html'><h3>CLICK HERE</h3></a>");
out.println("</font>");
  }
  
}catch(Exception e)
{
	out.println("<font face=Century Schoolbook>");
	out.println("<center><h1> OOps Values are not proper !!! Insert proper values...</h1></center>");
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><h2>To Try again</h2>");
	  out.print("<br>");
	  out.print("<center><a href='Payment.html'><h3>CLICK HERE</h3></a>");
	  out.print("<br>");
	  out.print("<br>");

	  out.print("<center><h2>To go back to choose other Tables</h2>");
	  out.print("<br>");
	  out.print("<center><a href='insert.html'><h3>CLICK HERE</h3></a>");
	  out.println("</font>");
}
    %>  
</body>
</html>