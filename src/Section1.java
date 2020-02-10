import java.io.*;  
import java.sql.*;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  

import javax.servlet.http.HttpServlet;


public class Section1 extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
    throws ServletException, IOException {  

response.setContentType("text/html");  
PrintWriter pw = response.getWriter();  
 
String SNAME=request.getParameter("sname");  
String sd=request.getParameter("sid");  
String nfe=request.getParameter("nofe");  

int SID=Integer.parseInt(sd);
int N0_OF_EQUIPMENTS=Integer.parseInt(nfe);

try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");  

PreparedStatement ps=con.prepareStatement("insert into GYM_SECTION values(?,?,?)");  

ps.setString(1,SNAME);  
ps.setInt(2,SID);  
ps.setInt(3,N0_OF_EQUIPMENTS); 
  
int i=ps.executeUpdate();  
if(i>0)  
{	
pw.print("You are successfully registered..."); 
//pw.print("<center><a href='insert.html'>INSERT</a>");
 
}
else
pw.print("You are Not successfully registered..."); 
  
}catch(Exception e2) {System.out.println(e2);} 


RequestDispatcher myDispatch = request.getRequestDispatcher("GymSection.html");
myDispatch.forward(request, response); 
pw.close();  
}  	

}
