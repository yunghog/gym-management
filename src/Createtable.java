import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import javax.servlet.*;
import java.sql.*;

public class Createtable extends GenericServlet {
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
			ServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");  
		PrintWriter pw = response.getWriter();  
		String tab=request.getParameter("table"); 	
		int n=Integer.parseInt(tab);
switch(n)
{
	case 1:	try{
					Statement st=con.createStatement();
					st.executeUpdate("CREATE TABLE GYM_SECTION(SNAME VARCHAR(20),SID INTEGER,PRIMARY KEY(SID),NO_OF_EQUIPMENTS INTEGER);");
					pw.println("GYM_SECTION TABLE CREATED SUCCESSFULLY");
					}
					catch(SQLException e)
		  			{
						pw.println("TABLE ALREADY EXISTS");
		  			}break;
	case 2:	try{
					Statement st=con.createStatement();
					st.executeUpdate("CREATE TABLE TRAINER(TNAME VARCHAR(20),MID INTEGER,PRIMARY KEY(MID),ADDRESS VARCHAR(20),PHONE INTEGER,SID INTEGER ,FOREIGN KEY(SID) REFERENCES GYM_SECTION(SID) ON DELETE CASCADE);");
					pw.println("TRAINER TABLE CREATED SUCCESSFULLY");
					}
					catch(SQLException e)
					{
						pw.println("TABLE ALREADY EXISTS");
					}break;
case 3:	try{
					Statement st=con.createStatement();
					st.executeUpdate("CREATE TABLE CUSTOMER(CNAME VARCHAR(20),CID INTEGER,PRIMARY KEY(CID),PAYMENT_OPTION VARCHAR(20),PHONE INTEGER,MID INTEGER,SID INTEGER,FOREIGN KEY(MID) REFERENCES TRAINER(MID) ON DELETE CASCADE,FOREIGN KEY(SID) REFERENCES GYM_SECTION(SID) ON DELETE CASCADE);");
					pw.println("CUSTOMER TABLE CREATED SUCCESSFULLY");
    				}
					catch(SQLException e)
					{
						pw.println("TABLE ALREADY EXISTS");
					}break;
case 4:	try{
					Statement st=con.createStatement();
					st.executeUpdate("CREATE TABLE EQUIPMENT(ENAME VARCHAR(20),EID INTEGER,PRIMARY KEY(EID),SID INTEGER,FOREIGN KEY(SID) REFERENCES GYM_SECTION(SID) ON DELETE CASCADE);");
					pw.println("EQUIPMENT TABLE CREATED SUCCESSFULLY");
    				}
					catch(SQLException e)
					{
						pw.println("TABLE ALREADY EXISTS");
					}break;
case 5:	try{
					Statement st=con.createStatement();
					st.executeUpdate("CREATE TABLE PAYMENT(PAY_NO INTEGER,PRIMARY KEY(PAY_NO),AMOUNT INTEGER,CID INTEGER,FOREIGN KEY(CID) REFERENCES CUSTOMER(CID) ON DELETE CASCADE);");
					pw.println("PAYMENT TABLE CREATED SUCCESSFULLY");
    				}
					catch(SQLException e)
					{
						pw.println("TABLE ALREADY EXISTS");
					}break;
case 6:	try{
					Statement st=con.createStatement();
					st.executeUpdate("CREATE TABLE WAREHOUSE(M_NO INTEGER,PRIMARY KEY(M_NO),MNAME VARCHAR(20),DESCRIPTION VARCHAR(20),SID INTEGER,FOREIGN KEY(SID) REFERENCES GYM_SECTION(SID) ON DELETE CASCADE);");
					pw.println("WAREHOUSE TABLE CREATED SUCCESSFULLY");
    				}
					catch(SQLException e)
					{
						pw.println("TABLE ALREADY EXISTS");
					}break;

}
		pw.close();	

	}
}



