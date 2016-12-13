

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CNG_sigin
 */
@WebServlet("/CNG_sigin")
public class CNG_sigin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public CNG_sigin() {
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
		Connection con ;
		String fn=request.getParameter("UserName");
		String ln=request.getParameter("boardName");
		String bn=request.getParameter("password");
		String board=request.getParameter("maxplayers");
		String colr=request.getParameter("color");
		
		try{  
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
			Statement st=con.createStatement();
			ResultSet rs =st.executeQuery("Select game_name from game_details where game_name='"+ln+"'");
			
			System.out.println("CNG_sign.jva ppage "+colr);
			if(rs.next())
			{
				response.sendRedirect("create_a_new_game.jsp");
			}
			else
			{
					PreparedStatement ps=con.prepareStatement("insert into game_details values(?,?,?,?)");
					ps.setString(1,ln);  
					ps.setString(2,bn);  
					ps.setString(3,board);
					ps.setString(4,fn);
					ps.executeUpdate();
					System.out.println("Game Created");
					PreparedStatement ps1=con.prepareStatement("insert into player_details values(?,?,?,?,?,?)");
					ps1.setString(1,fn);  
					ps1.setString(2,ln);  
					ps1.setString(3,colr);
					ps1.setString(4,"0");
					ps1.setString(5,"0");
					ps1.setString(6,bn);
					ps1.executeUpdate();
					System.out.println("Player Created");
					
					HttpSession hs=request.getSession(false);
					hs.setAttribute("pwd", bn);
					hs.setAttribute("board", ln);
					 response.sendRedirect("waiting.jsp");
				}
				con.close();
				st.close();
				rs.close();
			}catch (Exception e2) {System.out.println(e2);}  
		
		
	}
}
