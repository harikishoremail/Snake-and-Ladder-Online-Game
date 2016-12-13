<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registration</title>
		<link type="text/css" rel="stylesheet" href="mycss.css">
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
				<li><a href="index.jsp">Home</a></li>
				<li><a href=""><span class="tbar"><Strong>Registration</Strong></span> </a></li>
				<li><a href="create_a_new_game.jsp">Create a Game</a></li>
				<li><a href="Join_Game.jsp">Join in a Game</a></li>
			</ul>
		</div>
		<!--table---->
		<form action="Registration" method="post">
		<div id="main">
		<table cellpadding="6px" width="50%"   align="center"   bgcolor="#F0E0B0" cellspacing="4px"  class="effect">
		
		<tr class="noBorder">
		<td>First Name<br></td>
		<td><input type="text" size="30" name="Fname" value="" required placeholder="Fist name" onblur="name(this.value)"></td>
		</tr>
	
		
		<tr class="noBorder">
		<td>Last Name<br></td>
		<td><input type="text" size="30" value="" name="Lname" placeholder="Last name" required onblur="name(this.value)"></td>
		</tr>
	
		
		<tr class="noBorder">
		<td>User Name</td>
		<td><input type="text" size="30" value="" placeholder="Email ID" name="Uname" required onblur="username(this.value)"></td>
		</tr>
		
		<tr class="noBorder">
		<td>DOB</td>
		<td><input type="date" size="30" placeholder="DD/MM/YYYY " value="date" required  name="dob" onblur="dob(this.value)"></td>
		</tr>
		
		<tr class="noBorder">
		<td>Sex</td>
		<td><input type="radio" name="sex" value="male" size="10">Male
		<input type="radio" name="sex" value="Female" size="10">Female</td>
		</tr>
		
		<tr class="noBorder">
		<td>Email Id</td>
		<td><input type="text" size="30" value="" name="email" placeholder="Email id" required onblur="email(this.value)"></td>
		</tr>	
		
		<tr class="noBorder">
		<td>Password</td>
		<td><input type="text" size="30" value="" name="password" placeholder="**********" required onblur="password(this.value)"></td>
		</tr>	
		
		<tr class="noBorder">
		<td>retype password</td>
		<td><input type="text" size="30" value="" required placeholder="***********" onblur="password(this.value)"></td>
		</tr>	
		
		<tr class="noBorder">
		<td >Address</td>
		<td><input type="text" size="30" value="" name="address" placeholder="Address" required onblur="name(this.value)">
		</td>
		</tr>
		
		<tr class="noBorder">
		<td>Secret question</td>
		<td><select name="Question">
		<option value="-1" selected>select..</option>
		<option value="text">What is your nick name ?</option>
		<option value="text">What is your pet name ?</option>
		<option value="text">What is your school name ?</option>
		<option value="text">What is your home town ?</option>
		</select></td>
		</tr>
		
		<tr class="noBorder">
		<td>Answer</td>
		<td><input type="text" size="30" value="" name="answer" placeholder="Enter here " required onblur="name(this.value)">
		</td>
		</tr>
		
		<tr class="noBorder">
		<td>Alternate Email</td>
		<td><input type="text" size="30" value="" name="aemail" placeholder="alternate email" required onblur="email(this.value)">
		</td>
		</tr>
		
		<tr class="noBorder"> 
	      <td>&nbsp;</td>
	      <td><input type="submit" value="submit" >&nbsp;
	      <input type="reset" value="Reset" id="btnReset"></td>
      	  <td>&nbsp;</td></tr>
		
		</table>
		</div>
		</form>
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