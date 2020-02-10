import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Trainer extends GenericServlet {
	Connection con;
	public void init()throws ServletException
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");	
		}catch(Exception e)
		{
			System.out.print(e);
		}
		
		
	}
	public void service(ServletRequest request,
			ServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");  
		PrintWriter pw = response.getWriter();  
		
		String TNAME=request.getParameter("tname");
		String MD=request.getParameter("mid");  
		String ADDRESS=request.getParameter("add");  
		String PHO=request.getParameter("ph");  
		String SD=request.getParameter("sid");  
		
		
		
		int MID=Integer.parseInt(MD);
		int PHONE=Integer.parseInt(PHO);
		int SID=Integer.parseInt(SD);

		
try{  
		  

PreparedStatement ps=con.prepareStatement("insert into TRAINER values(?,?,?,?,?)");  

		ps.setString(1,TNAME);  
		ps.setInt(2,MID);  
		ps.setString(3,ADDRESS);  
		ps.setInt(4,PHONE);  
		ps.setInt(5,SID);  
		 
		int i=ps.executeUpdate();  
		if(i>0) 
		{	
		pw.print("You are successfully registered...");  
		pw.print("<a href='home.html'>Bach to Home Page</a>");
		}
		else
		{	
		pw.print("You are Not successfully registered...");
		pw.print("<a href='registration.html'>REGSITRATION</a>");
		}
		  
		}catch(Exception e2) {System.out.println(e2);}  
			
			pw.close();
			}
}
