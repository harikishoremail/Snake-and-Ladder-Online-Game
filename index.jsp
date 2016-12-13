<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
			<ul>
				<li><a href=""><span class="tbar"><Strong>Home</Strong></span></a></li>
				<li><a href="registration.jsp">Registration</a></li>
				<li><a href="create_a_new_game.jsp">Create a Game</a></li>
				<li><a href="Join_Game.jsp">Join in a Game</a></li>
				<li><a href="login.jsp">Login</a></li>
			</ul>
		</div>
		
		<div>
			<b><span class="whit" >Snakes and Ladders is an interactive online version of the classic board game. Kids will have fun as they roll the dice and move up the board in a race against their opponent- the computer. As kids move up the numbered grids they will also practice number recognition and counting from 1 to 100 and thus improve their math skills as well. Kids will enjoy hours of endless fun with this engaging game. This game will improve the kid's counting skills, calculating skills and sharpen the mind.
			</b></span>
		</div>
		<div class="slider" id="main-slider"><!-- outermost container element -->
			<div class="slider-wrapper"><!-- innermost wrapper element -->
				<img src="img/50.jpg" alt="First" class="slide" /><!-- slides -->
				<img src="img/51.png" alt="Second" class="slide" />
				<img src="img/1.png" alt="Third" class="slide" />
			</div>
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