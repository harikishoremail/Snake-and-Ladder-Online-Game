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
<title>Game</title>
		<link type="text/css" rel="stylesheet" href="mycss.css">
		<style type="text/css">
	.my_content_container a {
	    color: black;
	    display: block;
	    height: 2.5em;
	    padding: 5 1em;
	    width: 15em;       
	    text-decoration: none;
	    margin :10px; 
	    
	}
	</style>
</head>
<body>
<!-- java script ---->
		<script type="text/javascript"  src="javascript.js"> 
		</script>
		
		<!---header-->
		<div id="header">
			<h1>Snake and Ladder Game</h1>
		</div>
		<!---navbar-->
		<div id="navbar">
			<ul>
			<% 
			HttpSession hs=request.getSession(false);
			String Username=hs.getAttribute("usn").toString();
			%>	<li>User Name : <%= Username %></li>
				<li><a href="">Home</a></li>
				<li><a href="create_a_new_game.jsp">Create a Game</a></li>
				<li><a href="Join_Game.jsp">Join in a Game</a></li>
				<li><a href="wait.jsp">Instrustion</a></li>
				<li ><a href="signout.jsp">Sign out</a></li>
				
				
				<!--  li><a href="create_a_new_game.jsp">Create a Game</a></li-->
				
				<li><a href="signout.jsp">Sign out</a></li>
			</ul>
		</div>
		<!--         main funtion      -->
		
		<!-- +++++++++++++++ Create game +++++++++++++++++++++ -->
		<div id="first" class="my_content_container">
		
		<a href="create_a_new_game.jsp"><button>Create a Game</button></a>
		<a href="Join_Game.jsp"><button>Join in a Game</button></a>
		</div>
		<div id="second">
		<h4 align="center">List of games avilable</h4>
		
             <%
            	Connection conn;
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
                ResultSet rs;
                String sql3 = "select game_name from game_details" ;
                PreparedStatement pst3 =  conn.prepareStatement(sql3);
                rs = pst3.executeQuery(sql3);
                    
            while(rs.next()){%> 
                 <%= rs.getString(1) %>
                 <br/>
            <% } %>  
		</div>
		<!---Footer-->
		<div id="Footer">
		<hr>
			<ul>
				<li><a href="">About Us</a></li>
				<li><a href="">Careers</a></li>
				<li><a href="">Help</a></li>
				<li><a href="">Contact</a></li>
			</ul>
			<h5 >&copy; Snake and Ladder All Right Reserverd </h5>
			<h6>Ch.hari kishore,
				Msit 1st Year
				Jntu Ananthpur
				9885555917</h6>
		</div>

</body>
</html>