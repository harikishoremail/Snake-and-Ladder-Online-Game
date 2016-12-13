import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Log_in")
public class Log_in extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Log_in() {
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
		Connection con = null ;
		System.out.println("Connected to Log_in.java");
		//response.setContentType("text/html");   
		PrintWriter out = response.getWriter();
		String fn=request.getParameter("uname");
		String ln=request.getParameter("password");
		System.out.println(fn+"   "+ ln);
		boolean flag=false;
		try{  
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
			Statement st=con.createStatement();
			ResultSet rs =st.executeQuery("Select UserName,Password from registration");
			System.out.println(" Log_in.java.Yes working");
			while(rs.next()){
					System.out.println("checking");
					System.out.println(rs.getString(1));
					
					if(rs.getString(1).equals(fn) && rs.getString(2).equals(ln) ){
						HttpSession hs=request.getSession(true);
						hs.setAttribute("usn", fn);
						System.out.println("match found in log_in");
						flag=true;
						break;
						}else {
							flag=false;
							System.out.println("No userid found");
						}
			}
			if(flag){
				response.sendRedirect("Sigin.jsp");
			}else {
				response.sendRedirect("login.jsp");
			}
			con.close();
			st.close();
			out.close();
			}catch (Exception e2) {System.out.println(e2);}
	}

}
