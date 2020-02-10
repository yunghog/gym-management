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


   
   String tab=request.getParameter("table"); 	
	int n=Integer.parseInt(tab);
	
switch(n)
{
   
case 1:   //String query1="select * from GYM_SECTION";
          CallableStatement st1=con.prepareCall("{call disp()}");
         ResultSet rs1=st1.executeQuery();
	
         
         out.print("<td><h2><u>"+" Gym Section Details   :  </u></h2></td>");
     	out.print("</br>");
     	out.print("	<center><table  border=2><tr><td><h2>SNAME</h2></td><td><h2>SID</h2></td><td><h2>N0_OF_MACHINES</h2></td></tr>");
     	 	
	while(rs1.next())  
	{
	String name=rs1.getString("SNAME");	
	int SID=rs1.getInt("SID");
	int Nofe=rs1.getInt("NO_OF_EQUIPMENTS");
	

	out.print("<tr>");
	out.print("<td><h3>"+name+"</h3></td>");
	out.print("<td><h3> "+SID+"</bh3></td>");
	out.print("<td><h3>"+Nofe+"</h3></td>");
	out.print("</tr>");

	
	

	   }
	out.print("</table>");
   break;
   
case 2:
	   //String query2="select * from TRAINER";
	   CallableStatement st2=con.prepareCall("{call disp2()}");
       ResultSet rs2=st2.executeQuery();
	
	   out.print("<td><h2><u>"+" Trainer Details   :  </u></h2></td>");
    	out.print("</br>");
    	out.print("	<center><table  border=2><tr><td><h2>TNAME</h2></td><td><h2>MID</h2></td><td><h2>ADDRESS</h2></td><td><h2>PHONE</h2></td><td><h2>SID</h2></td></tr>");
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
break;

case 3:
	  // String query3="select * from CUSTOMER";
	   CallableStatement st3=con.prepareCall("{call disp3()}");
       ResultSet rs3=st3.executeQuery();
	
	   out.print("<td><h2><u>"+" Member  Details   :  </u></h2></td>");
    	out.print("</br>");
    	out.print("	<center><table  border=2><tr><td><h2>MNAME</h2></td><td><h2>CID</h2></td><td><h2>AYMENT_OPTION</h2></td><td><h2>PHONE</h2></td><td><h2>MID</h2></td><td><h2>SID</h2></td></tr>");
	
	while(rs3.next())  
{
String name=rs3.getString("CNAME");	
int cid=rs3.getInt("CID");
String add=rs3.getString("PAYMENT_OPTION");
int ph=rs3.getInt("PHONE");
int mid=rs3.getInt("MID");
int sid=rs3.getInt("SID");	

out.print("<tr>");
out.print("<td><h3>"+name+"</h3></td>");
out.print("<td><h3> "+cid+"</bh3></td>");
out.print("<td><h3>"+add+"</h3></td>");
out.print("<td><h3>"+ph+"</h3></td>");
out.print("<td><h3> "+mid+"</bh3></td>");
out.print("<td><h3> "+sid+"</bh3></td>");
out.print("</tr>");

}
	out.print("</table>");
break;

case 4:
	  // String query4="select * from EQUIPMENT";
	   CallableStatement st4=con.prepareCall("{call disp4()}");
       ResultSet rs4=st4.executeQuery();
	
	   out.print("<td><h2><u>"+" Equipment  Details   :  </u></h2></td>");
    	out.print("</br>");
    	out.print("	<center><table  border=2><tr><td><h2>ENAME</h2></td><td><h2>EID</h2></td><td><h2>SID</h2></td></tr>");
	   
	while(rs4.next())  
{
String name=rs4.getString("ENAME");	
int eid=rs4.getInt("EID");
int sid=rs4.getInt("SID");	

out.print("<tr>");
out.print("<td><h3>"+name+"</h3></td>");
out.print("<td><h3> "+eid+"</h3></td>");
out.print("<td><h3>"+sid+"</h3></td>");
out.print("</tr>");

}
	out.print("</table>");
break;

case 5:
	   //String query5="select * from PAYMENT";
	   CallableStatement st5=con.prepareCall("{call disp5()}");
       ResultSet rs5=st5.executeQuery();
	
	   out.print("<td><h2><u>"+" Payment Details   :  </u></h2></td>");
    	out.print("</br>");
    	out.print("	<center><table  border=2><tr><td><h2>PAY_NO</h2></td><td><h2>AMOUNT</h2></td><td><h2>CID</h2></td></tr>");
    	
	while(rs5.next())  
{
int pno=rs5.getInt("PAY_NO");
int amt=rs5.getInt("AMOUNT");
int cid=rs5.getInt("CID");	

out.print("<tr>");
out.print("<td><h3>"+pno+"</h3></td>");
out.print("<td><h3> "+amt+"</bh3></td>");
out.print("<td><h3>"+cid+"</h3></td>");
out.print("</tr>");

}
	out.print("</table>");
break;

case 6:
	  // String query6="select * from WAREHOUSE";
	   CallableStatement st6=con.prepareCall("{call disp6()}");
       ResultSet rs6=st6.executeQuery();
	
	   out.print("<td><h2><u>"+" Medicinal Details   :  </u></h2></td>");
    	out.print("</br>");
    	out.print("	<center><table  border=2><tr><td><h2>MNAME</h2></td><td><h2>M_NO</h2></td><td><h2>DESCRIPTION</h2></td><td><h2>SID</h2></td></tr>");
	   
	while(rs6.next())  
{
		String name=rs6.getString("MNAME");		
int mno=rs6.getInt("M_NO");
String des=rs6.getString("DESCRIPTION");
int sid=rs6.getInt("SID");	

out.print("<tr>");
out.print("<td><h3>"+name+"</h3></td>");
out.print("<td><h3> "+mno+"</bh3></td>");
out.print("<td><h3>"+des+"</h3></td>");
out.print("<td><h3> "+sid+"</bh3></td>");
out.print("</tr>");

}
	out.print("</table>");
break;


}
 }
 catch(Exception e)
 {
	 out.print("Cannot Display!!!");
 }
   
%>
</body>