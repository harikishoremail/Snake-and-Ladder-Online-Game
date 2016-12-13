

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		// TODO Auto-generated method stub
		Connection con ;
		//response.setContentType("text/html");   
		System.out.print("post am here");
		String fn=request.getParameter("Fname");
		String ln=request.getParameter("Lname");
		String un=request.getParameter("Uname");
		String db=request.getParameter("dob");
		String sex=request.getParameter("sex");
		String eid=request.getParameter("email");
		String pwd=request.getParameter("password");
		String add=request.getParameter("address");
		String ans=request.getParameter("answer");
		String aeid=request.getParameter("aemail");
		System.out.print("Sucessfully get the details");
		
		try{  
			Class.forName("com.mysql.jdbc.Driver"); 
			System.out.println("Connecting to Databse");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
		  
			PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?,?,?)");  
			  
			ps.setString(1,fn);  
			ps.setString(2,ln);  
			ps.setString(3,un);
			ps.setString(4,db);
			ps.setString(5,sex);
			ps.setString(6,eid);
			ps.setString(7,pwd);
			ps.setString(8,add);
			ps.setString(9,ans);
			ps.setString(10,aeid);
			int i=ps.executeUpdate();
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			con.close();
			ps.close();
			}catch (Exception e2) {System.out.println(e2);}  
		
	}

}
