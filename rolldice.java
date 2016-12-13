

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class rolldice
 */
@WebServlet("/rolldice")
public class rolldice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rolldice() {
        super();
       
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Welcome to Controller.java");
        
        response.setContentType("text/html;charset=UTF-8");
        HttpSession hs=request.getSession(false);
        String UserName=hs.getAttribute("usn").toString();
        String board=hs.getAttribute("board").toString();
        
        if( UserName== null) 
        {
            response.sendRedirect("login.jsp");
        }
        int count=0;/*'"+boar.getAttribute("board")+"'*/
        String query="select count(player_name) from player_details where game_name='"+board+"'";
       
        Connection conn;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
			 PreparedStatement ps =  conn.prepareStatement(query);
		        ResultSet rs = ps.executeQuery();
		        while(rs.next())
		        {
		            count=rs.getInt("count(player_name)");
		        }
		        
		        
		        if(count<=0)
		        {
		            RequestDispatcher rd = getServletContext().getRequestDispatcher("/waiting.jsp");
		            rd.forward(request, response);
		        }
		        
		        else
		        {
		        int roll=(int) Math.floor((Math.random()*6) +1 );
		        int previous_position=0,curp=0;
		        System.out.println("1sdfasd");
		        Class.forName("com.mysql.jdbc.Driver");
		        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
		        query="select current_position,previous_position from player_details where player_name='"+UserName+"'";
		        ps =  conn.prepareStatement(query);
		        rs = ps.executeQuery();
		        
			        while(rs.next())
			        {
			            curp = rs.getInt("current_position");
			        }
			        System.out.println(roll+"am the roll dice page");
			        conn.close();
			        previous_position=curp;
			        curp=curp+roll;
			        if(curp==5){
			        	curp=16;
			        }else if(curp==7){
			        	curp=4;
			        }else if(curp==9){
			        	curp=13;
			        }else if(curp==21){
			        	curp=23;
			        }else if(curp==28){
			        	curp=53;
			        }else if(curp==35){
			        	curp=22;
			        }else if(curp==42){
			        	curp=46;
			        }else if(curp==56){
			        	curp=85;
			        }else if(curp==60){
			        	curp=40;
			        }else if(curp==62){
			        	curp=76;
			        }else if(curp==69){
			        	curp=73;
			        }else if(curp==90){
			        	curp=84;
			        }else if(curp==94){
			        	curp=96;
			        }else if(curp==99){
			        	curp=24;
			        }
		        
		        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
		        String query2="update player_details set current_position = "+curp+", previous_position = "+previous_position+"  where player_name = '"+UserName+"'" ;
		        ps =  conn.prepareStatement(query2);
		        ps.executeUpdate();
		        conn.close();
		        
		        int flag=0;
		        Class.forName("com.mysql.jdbc.Driver");
		        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
		        query="select current_position from player_details where game_name='"+board+"'";/*"+boar.getAttribute("board")+"*/
		        ps =  conn.prepareStatement(query);
		        rs = ps.executeQuery();
		        
		        while(rs.next())
		        {
		            curp = rs.getInt("current_position");
		            if(curp>=100)
		            {
		                flag=1;
		                break;
		            }
		            else
		            {
		                flag=0;
		            }
		        }
		        conn.close();
		        
		        if(flag==1)
		        {
		            RequestDispatcher rd = getServletContext().getRequestDispatcher("/winnerpage.jsp");
		            rd.forward(request, response);
		        }
		        else
		        {
		            RequestDispatcher rd = getServletContext().getRequestDispatcher("/gameBoard.jsp");
		            rd.forward(request, response);
		        }
		        }
		        
		            
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	} 
}
