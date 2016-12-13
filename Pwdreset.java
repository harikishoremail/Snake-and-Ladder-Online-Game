

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Pwdreset
 */
@WebServlet("/Pwdreset")
public class Pwdreset extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int flag;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pwdreset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Connecting to Databse");
		Connection con ;
		String fn=request.getParameter("uname");
		String ln=request.getParameter("ans");
		String bn=request.getParameter("npwd");
		String bn1=request.getParameter("rnwpwd");
		try{  
			Class.forName("com.mysql.jdbc.Driver"); 
			System.out.println("Connecting to Databse");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
			Statement st=con.createStatement();
			ResultSet rs =st.executeQuery("Select registration.UserName,registration.SQans from registration;");
			while(rs.next()){
				if(rs.getString(1).equals(fn) && rs.getString(2).equals(bn)){
					 flag=1;
				}else{
					response.sendRedirect("login.jsp");
				}
			}
			
			
			con.close();
			rs.close();
			st.close();
			if(flag==1){
				Connection conn ;
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
		        String query2="update registration set Password = "+bn+"  where player_name = '"+fn+"'" ;
		        PreparedStatement ps = conn.prepareStatement(query2);
		        ps.executeUpdate();
		        conn.close();
				ps.close();
			}   
			}catch (Exception e2) {System.out.println(e2);}  
	}

}
