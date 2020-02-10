

import javax.servlet.*;
import java.io.*;
import java.sql.*;
import javax.servlet.http.*;


public class LoginServlet extends HttpServlet {

	private Connection con;
	private PreparedStatement ps=null;

	public void init() throws ServletException {
		System.out.println("In init");
		/*Getting the connection in init method and using it to 
		 *handle the request is not a better practice in all the cases
		 */ 
		try {
			Class.forName("com.mysql.jdbc.Driver");  
		    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","root");
			ps=con.prepareStatement(
			"select * from admin where uname=? and pass=?");
		}//try
		catch(Exception e){
			e.printStackTrace();
			throw new ServletException(
			"Initialization failed, Unable to get DB connection");
		}//catch
	}//init

	public void service (HttpServletRequest req, HttpServletResponse res) 
	throws ServletException, IOException {

		System.out.println("In service");

		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		try {

			String uname=req.getParameter("uname");
			String pass= req.getParameter("pass");

if(uname==null||uname.equals("")||pass==null||
pass.equals("")) {

				out.println("<html><body bgcolor=Pink><center>");
out.println("<h2><i>User Name and Password cannot be empty....</i><br/></br>");
out.println("<i>We cannot log you into your account at this time. Please try again later...</h2></i>");
				out.println("</center></body></html>");
				return;
			}//if

			ps.setString(1,uname);
			ps.setString(2,pass);
			ResultSet rs=ps.executeQuery();

			out.println("<html><body>");
			if (rs.next()){
			res.setStatus(res.SC_MOVED_TEMPORARILY);
			res.setHeader("Location","owner.html");
				
			}
			else{
				out.println("<html><body bgcolor=Pink><center>");
				out.println("<h2>Invalid username and password...</h2></br>");
out.println("<h2>We cannot log you into your account at this time. Please try again later...</h2>");
			out.println("</body></html>");
			}
		}//try
		catch(Exception e){
out.println("<h2>Unable to the process the request try after some time</h2>");
		}//catch
	}//service

	public void destroy () {
		System.out.println("In destroy");
		try {con.close();}
		catch(Exception e){}
	}//destroy
}//class  
