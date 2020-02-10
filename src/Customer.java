import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Customer extends GenericServlet {
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
		

		
try{  
		  

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
