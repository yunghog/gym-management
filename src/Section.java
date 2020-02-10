import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Section extends GenericServlet {
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
	  
		String SNAME=request.getParameter("sname");  
		String sd=request.getParameter("sid");  
		String nfe=request.getParameter("nofe");  
		
		int SID=Integer.parseInt(sd);
		int N0_OF_EQUIPMENTS=Integer.parseInt(nfe);


		
try{  
		  

PreparedStatement ps=con.prepareStatement("insert into GYM_SECTION values(?,?,?)");  

ps.setString(1,SNAME);  
ps.setInt(2,SID);  
ps.setInt(3,N0_OF_EQUIPMENTS);  
		int i=ps.executeUpdate();  
		if(i>0) 
		{	
		pw.print("You are successfully registered...");  
		pw.print("<a href='insert.html'>Back to Home Page</a>");
		}
		else
		{	
		pw.print("You are Not successfully registered...");
		pw.print("<a href='GymSection.html'>INSERT</a>");
		}
		  
		}catch(Exception e2) {System.out.println(e2);}  
			
			pw.close();
			}
}
