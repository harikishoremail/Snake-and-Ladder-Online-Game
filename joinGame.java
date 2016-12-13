

import java.io.IOException;
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
 * Servlet implementation class joinGame
 */
@WebServlet("/joinGame")
public class joinGame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinGame() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con ;
		String fn=request.getParameter("UserName");
		String ln=request.getParameter("boardName");
		String bn=request.getParameter("password");
		String colr=request.getParameter("color");
		/*HttpSession pass=request.getSession(false);
		pass.getAttribute("pwd1");
		HttpSession boardna=request.getSession(false);
		boardna.getAttribute("boardn");*/
		try{  
			Class.forName("com.mysql.jdbc.Driver"); 
			System.out.println("am in joinGame.java");
			boolean flag=false;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
			Statement st=con.createStatement();
			ResultSet rs =st.executeQuery("Select game_name,passphrase from game_details where game_name='"+ln+"' and passphrase='"+bn+"'");
				System.out.println(ln+" "+bn+" ");
				while(rs.next()){
				if(rs.getString(1).equals(ln) && rs.getString(2).equals(bn)){
					flag=true;
				}else{
					flag=false;
				}
				System.out.println("joinGame.java");
				}
				
				if(flag){
					PreparedStatement ps1=con.prepareStatement("insert into player_details values(?,?,?,?,?,?)");
					ps1.setString(1,fn);  
					ps1.setString(2,ln);  
					ps1.setString(3,colr);
					ps1.setString(4,"0");
					ps1.setString(5,"0");
					ps1.setString(6,bn);
					int i=ps1.executeUpdate();
					System.out.println("Player Created");
					HttpSession hs=request.getSession(false);
					hs.setAttribute("pwd", bn);
					hs.setAttribute("board", ln);
						 response.sendRedirect("waiting.jsp");
				}else {
					 response.sendRedirect("Sigin.jsp");
				}
			con.close();
			rs.close();
			st.close();
			}catch (Exception e2) {System.out.println(e2);}
	}
	}

