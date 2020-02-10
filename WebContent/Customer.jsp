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
String CNAME=request.getParameter("cname");  
String p=request.getParameter("cid");  
String PAYMENT_OPYION=request.getParameter("payop");  
String ss=request.getParameter("ph");  
String pu=request.getParameter("tid");
String dg=request.getParameter("sid");

int CID=Integer.parseInt(p);
int PHONE=Integer.parseInt(ss);
int MID=Integer.parseInt(pu);
int SID=Integer.parseInt(dg);


   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into CUSTOMER values(?,?,?,?,?,?)");  

	ps.setString(1,CNAME);  
	ps.setInt(2,CID);  
	ps.setString(3,PAYMENT_OPYION);  
	ps.setInt(4,PHONE);  
	ps.setInt(5,MID);  
	ps.setInt(6,SID);  
	  
  
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("<center><h1>****  You are successfully registered  ****</h1>");
 out.print("<br>");
 out.print("<br>");
 
 out.print("<center><h2>To Insert Again</h2>");
 out.print("<br>");
 out.print("<center><a href='Customer.html'>CLICK HERE</a>");
 out.print("<br>");
 out.print("<br>");
 
 out.print("<center><h2>To Choose Other Tables</h2>");
 out.print("<br>");
 out.print("<center><a href='insert.html'>CLICK HERE</a>");
  }
  else{
	  out.print("You are NOT successfully registered..."); 
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><h2>To Try again</h2>");
	  out.print("<br>");   
out.print("<center><a href='Customer.html'>TRY AGAIN</a>");
out.print("<br>");
out.print("<br>");

out.print("<center><h2>To choose other Tables</h2>");
out.print("<br>");
out.print("<center><a href='insert.html'>CLICK HERE</a>");
  }
}catch(Exception e)
{
	out.println("<center><h2> OOps Values are not proper !!! Insert proper values...</h2></center>");
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><h2>To Try again</h2>");
	  out.print("<br>");
	  out.print("<center><a href='Customer.html'>CLICK HERE</a>");
	  out.print("<br>");
	  out.print("<br>");

	  out.print("<center><h2>To go back to choose other Tables</h2>");
	  out.print("<br>");
	  out.print("<center><a href='insert.html'>CLICK HERE</a>");
}
  %>
</body>
</html>