<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement "%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- link type="text/css" rel="stylesheet" href="mycss.css"-->
<style>
#wait img{ 
	margin :200px;
	margin-left: 440px;
	
}</style>
    </head>
    <body>
      <div>
             <%
             	try{
             	Connection con=null;
             	Statement stmt = null;
	     		response.setIntHeader("refresh", 10);
	          	HttpSession hs=request.getSession(false);
				String gameBoard=hs.getAttribute("board").toString();
				System.out.println(gameBoard);
				String userName=hs.getAttribute("usn").toString();
	     		 String query="select count(player_name) from player_details where game_name='"+gameBoard+"'";
	     		 System.out.println(userName+" is the name in waiting page"+gameBoard);
	     		 int count=0;
	     		 
	     
	     		Class.forName("com.mysql.jdbc.Driver"); 
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
				stmt = con.createStatement();
			    ResultSet rss = stmt.executeQuery(query);
			   /* rss.beforeFirst();*/
	             if(rss!=null && rss.next())
	             {
	                 count=rss.getInt(1);
	                 System.out.println(count+" is the count in player list");
	                 System.out.println(rss.getInt("count(player_name)")+" is the count in player list");
	             }
	             rss.close();
	             ResultSet rs=stmt.executeQuery("Select	* from game_details  where game_name='"+gameBoard+"';");
	             int maxPlayers=0;
	             if(rs.next())
	             {
	            	 maxPlayers=Integer.parseInt(rs.getString(3));
	             }
	             if(count==maxPlayers)
	             {
	            	 System.out.println("count is commited");
	            	 response.sendRedirect("gameBoard.jsp");
	             }
	             con.close();
	             stmt.close();
				}
             catch (Exception e2) {System.out.println(e2);}
	%>
    </div>
    <div id="wait">
            <img id="progress" src="please_wait.gif">
    </div>
</body>
</html>