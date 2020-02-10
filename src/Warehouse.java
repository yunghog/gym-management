import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Warehouse extends GenericServlet {
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
		String n=request.getParameter("m_no");  
		String MNAME=request.getParameter("mname");  
		String DESCRIPTION=request.getParameter("des");  
		String s=request.getParameter("sid");
		
		int M_NO=Integer.parseInt(n);
		int SID=Integer.parseInt(s);
	

		
try{  
		  

PreparedStatement ps=con.prepareStatement("insert into WAREHOUSE values(?,?,?,?)");  

		ps.setInt(1,M_NO);  
		ps.setString(2,MNAME); 
		ps.setString(3,DESCRIPTION);
		ps.setInt(4,SID);  
		 
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
