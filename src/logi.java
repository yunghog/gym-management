import javax.servlet.*;
import java.io.*;
import java.sql.*;
public class logi extends GenericServlet {
	public void service (ServletRequest req, ServletResponse res) 
			throws ServletException, IOException {

				System.out.println("In service");

				res.setContentType("text/html");
				PrintWriter out=res.getWriter();
				
				
				try {

					String un=req.getParameter("uname");
					String pa= req.getParameter("pass");

out.println("<html><body>");
			if ((un.equals("vinuta")&&(pa.equals("mn$cs113"))) ){
				out.println("<h3>Welcome, "+un+"</h3><br/>");
				out.println("<h2>Enjoy browsing the Site</h2>");
			}
			else
out.println("<h2>We cannot log you into your account at this time. Please try again later</h2>");
			out.println("</body></html>");
		}//try
		catch(Exception e){
out.println("<h2>Unable to the process the request try after some time</h2>");
		}//catch
	}//service

	
	}//destroy

