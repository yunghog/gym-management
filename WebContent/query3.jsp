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

   String PAYMENT_OPTION=request.getParameter("pname");
   
   PreparedStatement st=con.prepareStatement("select CNAME,AMOUNT from CUSTOMER c,PAYMENT p where c.CID=p.CID and c.PAYMENT_OPTION=?;");
  st.setString(1,PAYMENT_OPTION);
	ResultSet rs=st.executeQuery();
	
	
		while(rs.next())  
{
			
String name=rs.getString("CNAME");	
	

out.print("<table>");
out.print("<tr>");
out.print("<td>"+name+"</td>");
out.print("</tr>");

out.print("</table>");
out.print("</br>");
out.print("</br>");


   }
 
  
 %>
 </body>