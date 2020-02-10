import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Payment extends GenericServlet {
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
		String n=request.getParameter("pay_no");  
		String p=request.getParameter("amt");  
		String e=request.getParameter("cid");  
		
		
		int PAY_NO=Integer.parseInt(n);
		int AMOUNT=Integer.parseInt(p);
		int CID=Integer.parseInt(e);

		
try{  
		  

PreparedStatement ps=con.prepareStatement("insert into PAYMENT values(?,?,?)");  

		ps.setInt(1,PAY_NO);  
		ps.setInt(2,AMOUNT);  
		ps.setInt(3,CID);  
		 
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
