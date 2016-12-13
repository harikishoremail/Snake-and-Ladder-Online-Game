<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<title>Game</title>
		<link type="text/css" rel="stylesheet" href="mycss.css">
</head>
<body>
		<!---header-->
		<div id="header">
			<h1>Snake and Ladder Game</h1>
		</div>
		<!---navbar-->
		<div id="navbar">
		<% 
			HttpSession hs=request.getSession(false);
			String Username=hs.getAttribute("usn").toString();
			%>
			<ul><li>User Name : <%= Username %></li>
				<li><a href="Sigin.jsp"><span class="tbar"><Strong>Home</Strong></span></a></li>
				<li><a href="registration.jsp">Registration</a></li>
				<li><a href="create_a_new_game.jsp">Create a Game</a></li>
				<li><a href="Join_Game.jsp">Join in a Game</a></li>
				<li><a href="login.jsp">Login</a></li>
			</ul>
		</div>
		
<p></p>
 <div id="main">
		    
            <center>
            <p>Hurry!! <%=Username %></p>
            <img id="progress" src="YouWin.png"></center>
    </div>
</body>
</html>