<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create new Game</title>
		<link type="text/css" rel="stylesheet" href="mycss.css">
</head>
<body>
<!-- java script ---->
		<script type="text/javascript"  src="javascript.js"> 
		</script>
		<%
		HttpSession hs=request.getSession(false);
		if(hs.getAttribute("usn")==null){
			response.sendRedirect("login.jsp");
		}
		%>
		<!---header-->
		<div id="header">
			<h1>snake and ladder</h1>
		</div>
		<!---navbar-->
		<div id="navbar">
			<ul>
				<li>User Name : <%= hs.getAttribute("usn") %>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="registration.jsp">Registration</a></li>
				<li><a href=""><span class="tbar"><Strong>Create a Game</Strong></span></a></li>
				<li><a href="Join_Game.jsp">Join in a Game</a></li>
			</ul>
		</div>
		
		<!--====== Table=====--->
	<div id="main">
		<form action="CNG_sigin" method="post">
			
			<table cellpadding="6px" width="50%" bgcolor="#F0E0B0"  align="center"cellspacing="4px" class="effect">
			
			<tr class="noBorder" >
				<td > User Name</td>
				<td><input type="text" name="UserName" size="30" required placeholder="type here" value="" onblur="username(this.value)" ></td>
			</tr>
			
			<tr class="noBorder">
				<td>Board Name</td>
				<td><input type="text" name="boardName" size="30" required placeholder="type here" onblur="boardgame(this.value)"></td>
			</tr>	
			<tr class="noBorder">        
                <td > Number of Players : </td>
                <td >  
                    <select name="maxplayers">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </td>
            </tr>  
			<tr class="noBorder">
				<td>password</td>
				<td><input type="text" name="password" size="30" required placeholder="type here" value="" onblur="password(this.value)"></td>
			</tr>
			
			
			<tr class="noBorder">
				<td>Select die color</td>
				<td ><input type="radio" name="color" value="red" size="10">Red
					 <input type="radio" name="color" value="blue" size="10">Blue
					 <input type="radio" name="color" value="green" size="10">Green
					 <input type="radio" name="color" value="yellow" size="10">Yellow
				</td>
			</tr>	
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
			<td colspan="2" align="center">
				<a href="registration.html">Signup</a>
				</td>
			</tr>
		
			</table>
			</form>
		</div>
		<!---Footer-->
		<div id="Footer">
		<hr>
			<ul>
				<li><a href="">About Us</a></li>
				<li><a href="">Careers</a></li>
				<li><a href="">Help</a></li>
				<li><a href="">Contact us</a></li>
			</ul>
			<h5 >&copy; Snake and Ladder All Right Reserverd </h5>
			<h6>Ch.hari kishore,
				Msit 1st Year
				Jntu Ananthpur
				9885555917</h6>
		</div>
</body>
</html>