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
<title>Game Board</title>
	<link type="text/css" rel="stylesheet" href="mycss.css">
	
</head>
 <body onload="AddImage();">
 <!-- java script ---->
		<script type="text/javascript"  src="d6.js"> 
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
				<li ><a href="signout.jsp">Sign out</a></li>
			</ul>
		</div>

		<div id="board" >
		
		 	<button>Exit Game</button>
			 <table style="background-image: url(board.jpg);"  >
                  <tr class="noBorder" >
					<td id="100">&nbsp;</td>
					<td id="99"></td>
					<td id="98"></td>
					<td id="97"></td>
			        <td id="96"></td>
					<td id="95"></td>
					<td id="94"></td>
					<td id="93"></td>
			        <td id="92"></td>
					<td id="91"></td>
                 </tr>
                 
              <tr class="noBorder">
					<td id="81">&nbsp;</td>
					<td id="82"></td>
					<td id="83"></td>
					<td id="84"></td>
			        <td id="85"></td>
					<td id="86"></td>
					<td id="87"></td>
					<td id="88"></td>
			        <td id="89"></td>
					<td id="90"></td>
                 </tr>
                 
               <tr class="noBorder" >
					<td id="80">&nbsp;</td>
					<td id="79"></td>
					<td id="78"></td>
					<td id="77"></td>
			        <td id="76"></td>
					<td id="75"></td>
					<td id="74"></td>
					<td id="73"></td>
			        <td id="72"></td>
					<td id="71"></td>
                 </tr>
                 
             <tr class="noBorder">
					<td id="61">&nbsp;</td>
					<td id="62"></td>
					<td id="63"></td>
					<td id="64"></td>
			        <td id="65"></td>
					<td id="66"></td>
					<td id="67"></td>
					<td id="68"></td>
			        <td id="69"></td>
					<td id="70"></td>
                 </tr>
                 
            <tr class="noBorder" >
					<td id="60">&nbsp;</td>
					<td id="59"></td>
					<td id="58"></td>
					<td id="57"></td>
			        <td id="56"></td>
					<td id="55"></td>
					<td id="54"></td>
					<td id="53"></td>
			        <td id="52"></td>
					<td id="51"></td>
                 </tr>
                 
                 <tr class="noBorder">
					<td id="41">&nbsp;</td>
					<td id="42"></td>
					<td id="43"></td>
					<td id="44"></td>
			        <td id="45"></td>
					<td id="46"></td>
					<td id="47"></td>
					<td id="48"></td>
			        <td id="49"></td>
					<td id="50"></td>
                 </tr>
                 
              <tr class="noBorder" >
					<td id="40">&nbsp;</td>
					<td id="39"></td>
					<td id="38"></td>
					<td id="37"></td>
			        <td id="36"></td>
					<td id="35"></td>
					<td id="34"></td>
					<td id="33"></td>
			        <td id="32"></td>
					<td id="31"></td>
                 </tr>
                 
                 <tr class="noBorder">
					<td id="21">&nbsp;</td>
					<td id="22"></td>
					<td id="23"></td>
					<td id="24"></td>
			        <td id="25"></td>
					<td id="26"></td>
					<td id="27"></td>
					<td id="28"></td>
			        <td id="29"></td>
					<td id="30"></td>
                 </tr>
                 
                  <tr class="noBorder" >
					<td id="20">&nbsp;</td>
					<td id="19"></td>
					<td id="18"></td>
					<td id="17"></td>
			        <td id="16"></td>
					<td id="15"></td>
					<td id="14"></td>
					<td id="13"></td>
			        <td id="12"></td>
					<td id="11"></td>
                 </tr>
                 
                <tr class="noBorder">
					<td id="1">&nbsp;</td>
					<td id="2"></td>
					<td id="3"></td>
					<td id="4"></td>
			        <td id="5"></td>
					<td id="6"></td>
					<td id="7"></td>
					<td id="8"></td>
			        <td id="9"></td>
					<td id="10"></td>
                 </tr>
                 
            </table>
        </div>
        
        <!-- div id="games1"  -->
        <!-- ============= database connection ==================== -->
		<div id="games">
		<form action="rolldice" method="post">
		 <table border="1" bordercolor="black" cellpadding="5px" width="100%" > 
            
        <TR id="p2">
                <Th>Name</TH>
                <Th>Color</TH>
                <TH>Position</TH>
                 <TH>roll turn</TH>
            </TR>
                 <!-- "+boar.getAttribute("board")+"-->
            <%
            	 Connection conn=null;
           		 ResultSet rs=null;
           		HttpSession hs=request.getSession(false);
           		String gameBoard=hs.getAttribute("board").toString();
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"snake_and_ladder","root","toor");
                String sql3 = "select * from player_details where game_name = '"+gameBoard+"'" ;
               int count=1;
                PreparedStatement pst =  conn.prepareStatement(sql3);
                 rs = pst.executeQuery(sql3);
            while(rs.next()){%>
            
            <TR> 
                <TD> <%= rs.getString(1) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
           <% }%> <td> <%if(rs.getInt(7)==count){ %>
              <input type="submit" value="Roll Dice" >
              <% }else{%>
               <p></p>
               
               <%}%></td>
                </table></form>
               
		</div>
		<% int roll = (int) Math.floor((Math.random()*6) +1);%>	
        <script type="text/javascript">
			var total_images = 6;
			var roll =<%=roll%>
			var random_img = new Array();
			random_img[0] = '<a href=""><img src="die1.gif"></a>';
			random_img[1] = '<a href=""><img src="die2.gif"></a>';
			random_img[2] = '<a href=""><img src="die3.gif"></a>';
			random_img[3] = '<a href=""><img src="die4.gif"></a>';
			random_img[4] = '<a href=""><img src="die5.gif"></a>';
			random_img[5] = '<a href=""><img src="die6.gif"></a>';
			document.write(random_img[roll-1]);
			
			function AddImage()
			{
			  <%
			  String position ="1";
			  String color="red";
			  PreparedStatement ps =  conn.prepareStatement(sql3);
              rs = ps.executeQuery(sql3);
              while(rs.next()){
            	  position=rs.getString(4);
            	  color=  rs.getString(3);
            	  if(color.equalsIgnoreCase("red")){%>
            	  document.getElementById(<%=position%>).innerHTML ="<img src='red.jpg'>";
            	  <%}
            	  else if(color.equalsIgnoreCase("blue")){%>
            	  document.getElementById(<%=position%>).innerHTML ="<img src='blue.jpg'>";
            	  <%}
            	  else if(color.equalsIgnoreCase("yellow")) {%>
            	  document.getElementById(<%=position%>).innerHTML ="<img src='yellow.jpg'>";
            	  <%}
            	  else if(color.equalsIgnoreCase("green")){%>
            	  document.getElementById(<%=position%>).innerHTML ="<img src='green.jpg'>";
            	  <%}
              }
              conn.close();
              rs.close();
              pst.close();
			  %>
			 
			}
		</script>
		<style>
		#games input[type=submit]{
			width:auto;
			font-size: 16px;
			font-family:raleway;
			color: white;
			background-color:<%=color%>;
			}
		</style>
       <!--  "<img src='"+<%=color%>+"'.jpg'>"; -->
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
		</div>
</body>
</html>