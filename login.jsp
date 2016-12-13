<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
		<link type="text/css" rel="stylesheet" href="mycss.css">
</head>
<body>
	<!-- java script ---->
		<script type="text/javascript"  src="javascript.js"> 
		</script>

		<!---header-->
		<div id="header">
			<h1>snake and ladder</h1>
		</div>
		<!---navbar-->
		<div id="navbar">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="registration.jsp">Registration</a></li>
				<li><a href="create_a_new_game.jsp">Create a Game</a></li>
				<li><a href="Join_Game.jsp">Join in a Game</a></li>
				<li><a href="login.jsp"><span class="tbar"><Strong>Login</Strong></span></a></a></li>
			</ul>
		</div>
		<!--=====table====-->
	
		<div id="main">
		<form action="Log_in" method="post">
		
			<table cellpadding="6px" width="50%" bgcolor="#F0E0B0"  align="center"cellspacing="4px" class="effect">
			
			<tr class="noBorder">
				<td>User Name</td>
				<td><input type="text" size="30" value="" name="uname" required placeholder="type here" onblur="username(this.value)"></td>
			</tr >
				
			<tr class="noBorder">
				<td>password</td>
				<td><input type="text" size="30" value="" name="password" required placeholder="type here" onblur="password(this.value)"></td>
			</tr >
			
			<tr class="noBorder">
			<td colspan="2" align="center">
				<input type="submit" value="Submit" />
				</td>
			</tr>
			
			<tr class="noBorder">
			<td colspan="2" align="center">
				<a href="forgetpwd.html">Forget password</a>
			</td>
			</tr>
			<tr class="noBorder">
				<td colspan="2" align="center"><a href="registration.jsp">Sign Up</a></td>
			</tr>
		
			</table>
			</form>
		</div>
		<!---Footer-->
		<div id="Footer">
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