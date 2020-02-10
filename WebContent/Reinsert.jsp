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
String PHONE=request.getParameter("ph");  
String pu=request.getParameter("tid");
String dg=request.getParameter("sid");

int CID=Integer.parseInt(p);

int MID=Integer.parseInt(pu);
int SID=Integer.parseInt(dg);


   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into CUSTOMER values(?,?,?,?,?,?)");  

	ps.setString(1,CNAME);  
	ps.setInt(2,CID);  
	ps.setString(3,PAYMENT_OPYION);  
	ps.setString(4,PHONE);  
	ps.setInt(5,MID);  
	ps.setInt(6,SID);  
	  
  
  int i=ps.executeUpdate();
  if(i>0)
  {
	  out.print("<br>");
	  out.print("<br>");
	  out.println("<font face=Century Schoolbook>");
 out.print("<center><h1>  You are successfully registered </h1>");
 out.print("<br>");
 out.print("<br>");
 
 
 out.print("<center><a href='reinsert.html'><h2>Back To Home</h2></a>");
 out.print("<br>");
 out.print("<br>");
 out.println("</font>");

  }

}catch(Exception e)
{
	out.print("<br>");
	 out.print("<br>");
	 out.println("<font face=Century Schoolbook>");
	 out.print("<center><h1>You are NOT successfully registered !!!   Enter Appropriate Values ..</h1></center>"); 
	  out.print("<br>");
	  out.print("<br>");
	  
	  out.print("<center><h2>To Try again</h2>");
	  out.print("<br>");
	  out.print("<center><a href='reinsert.html'><h3>CLICK HERE</h3></a>");
	  out.print("<br>");
	  out.print("<br>");
	  out.print("<center><h2>To Back To Home</h2>");
	  out.print("<br>");
	  out.print("<center><a href='see.html'><h3>CLICK HERE</h3></a>");
	  out.println("</font>");
}
  %>
</body>
</html>