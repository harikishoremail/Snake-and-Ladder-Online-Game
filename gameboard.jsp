<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Snakes And Ladders</title>
<script src="JavaScripts/gameBoard.js" type="text/javascript"></script>
 <link href="css/gameBoardPage.css" rel="stylesheet" type="text/css"/> 
</head>
<body style="background:black;" onload="diceimage()">
<!-- <style>
td{
border:1px solid red;
}
</style> -->
<br/><br/>
<div id="container">

         <div>
         <% HttpSession ses = request.getSession(false);
            if(ses.getAttribute("Username")==null) 
            { %> 
            <div style="position: absolute; top:100px; left:1090px; color: white; margin: 5px; text-align:right; padding:5px;">
             <form action="login.jsp" method="post">
                <button type="submit" style="width:70px;"><b>Login</b></button> 
             </form>
             </div>
          <% } else { %>
           <div style="position: absolute; left:1120px; color: white; margin: 5px; text-align:right; padding:5px;">
              <p>Welcome&nbsp;<%=ses.getAttribute("Username")%>
              <form action="logout.jsp" method="post">
				<button type="submit" style="width:70px;"><b>Logout</b></button>
			 </form>
			 </div>
         <% } %>

<% response.setIntHeader("Refresh", 10); %>
<% HttpSession se = request.getSession(false);
   String game=se.getAttribute("Board").toString();
   String uname=se.getAttribute("Username").toString();
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;%>
<div style="background:#a8b6bf; color:black; font-family: Segoe UI; border: 3px solid black; ">
	<table style="background-image: url(images/snakes-and-ladders-board.jpg); height:550px; width:651px;">
                        <tr style="height: 57px;">
                        <!--100--><td id="100"  style="width: 81px"></td>
                        <!--99--><td id="99" style="width: 76px"></td>
                        <!--98--><td id="98" style="width: 76px"></td>
                        <!--97--><td id="97" style="width: 76px"></td>
                        <!--96--><td id="96" style="width: 76px"></td>
                        <!--95--><td id="95" style="width: 76px"></td>
                        <!--94--><td id="94" style="width: 77px"></td>
                        <!--93--><td id="93" style="width: 74px"></td>
                        <!--92--><td id="92" style="width: 76px"></td>
                        <!--91--><td id="91" style="width: 70px"></td>
                        </tr>

                        <tr style="height: 52px;">
                        <!--81--><td id="81"></td>
                        <!--82--><td id="82"></td>
                        <!--83--><td id="83"></td>
                        <!--84--><td id="84"></td>
                        <!--85--><td id="85"></td>
                        <!--86--><td id="86"></td>
                        <!--87--><td id="87"></td>
                        <!--88--><td id="88"></td>
                        <!--89--><td id="89"></td>
                        <!--90--><td id="90"></td>
                        </tr>

                        <tr style="height: 52px;">
                        <!--80--><td id="80"></td>
                        <!--79--><td id="79"></td>
                        <!--78--><td id="78"></td>
                        <!--77--><td id="77"></td>
                        <!--76--><td id="76"></td>
                        <!--75--><td id="75"></td>
                        <!--74--><td id="74"></td>
                        <!--73--><td id="73"></td>
                        <!--72--><td id="72"></td>
                        <!--71--><td id="71"></td>
                        </tr>

                        <tr style="height: 53px;">
                        <!--61--><td id="61"></td>
                        <!--62--><td id="62"></td>
                        <!--63--><td id="63"></td>
                        <!--64--><td id="64"></td>
                        <!--65--><td id="65"></td>
                        <!--66--><td id="66"></td>
                        <!--67--><td id="67"></td>
                        <!--68--><td id="68"></td>
                        <!--69--><td id="69"></td>
                        <!--70--><td id="70"></td>
                        </tr>

                        <tr style="height: 52px;">
                        <!--60--><td id="60"></td>
                        <!--59--><td id="59"></td>
                        <!--58--><td id="58"></td>
                        <!--57--><td id="57"></td>
                        <!--56--><td id="56"></td>
                        <!--55--><td id="55"></td>
                        <!--54--><td id="54"></td>
                        <!--53--><td id="53"></td>
                        <!--52--><td id="52"></td>
                        <!--51--><td id="51"></td>
                        </tr>

                        <tr style="height: 52px;">
                        <!--41--><td id="41"></td>
                        <!--42--><td id="42"></td>
                        <!--43--><td id="43"></td>
                        <!--44--><td id="44"></td>
                        <!--45--><td id="45"></td>
                        <!--46--><td id="46"></td>
                        <!--47--><td id="47"></td>
                        <!--48--><td id="48"></td>
                        <!--49--><td id="49"></td>
                        <!--50--><td id="50"></td>
                        </tr> 

                        <tr style="height: 53px">
                        <!--40--><td id="40"></td>
                        <!--39--><td id="39"></td>
                        <!--38--><td id="38"></td>
                        <!--37--><td id="37"></td>
                        <!--36--><td id="36"></td>
                        <!--35--><td id="35"></td>
                        <!--34--><td id="34"></td>
                        <!--33--><td id="33"></td>
                        <!--32--><td id="32"></td>
                        <!--31--><td id="31"></td>
                        </tr>

                        <tr style="height: 52px">
                        <!--21--><td id="21"></td>
                        <!--22--><td id="22"></td>
                        <!--23--><td id="23"></td>
                        <!--24--><td id="24"></td>
                        <!--25--><td id="25"></td>
                        <!--26--><td id="26"></td>
                        <!--27--><td id="27"></td>
                        <!--28--><td id="28"></td>
                        <!--29--><td id="29"></td>
                        <!--30--><td id="30"></td>
                        </tr>

                        <tr style="height: 53px">
                        <!--20--><td id="20"></td>
                        <!--19--><td id="19"></td>
                        <!--18--><td id="18"></td>
                        <!--17--><td id="17"></td>
                        <!--16--><td id="16"></td>
                        <!--15--><td id="15"></td>
                        <!--14--><td id="14"></td>
                        <!--13--><td id="13"></td>
                        <!--12--><td id="12"></td>
                        <!--11--><td id="11"></td>
                        </tr>

                        <tr style="height: 52px;">
                        <!--1--><td id="1"></td>
                        <!--2--><td id="2"></td>
                        <!--3--><td id="3"></td>
                        <!--4--><td id="4"></td>
                        <!--5--><td id="5"></td>
                        <!--6--><td id="6"></td>
                        <!--7--><td id="7"></td>
                        <!--8--><td id="8"></td>
                        <!--9--><td id="9"></td>
                        <!--10--><td id="10"></td>
                        </tr>
                    </table>
                    
    <div class="playerDetails" style="position: absolute; top:200px; right:100px;">
	<form name="diceform" action="GameLogicServlet" method="post" id="diceform">
    <br/><center>
    <img src="images/animated-dice.gif" id ="dice"name="dice" alt="p"/> 
    <input type="text" name="valuedice" style="width: 30px;margin-left: 100px;"id="valuedice"/><br/><br/>
    <div>
    <table width="350" height="30" style="text-align:center;background:black;">
        <tr style="background:#7d4627;color:white; height:35px;"><th ><b>Player name</b></th><th><b>Color</b></th><th><b>Position</b></th><th>&nbsp;</th></tr>
        <% String color1=null,color2=null,color3=null,color4= null,curr_pos1=null,curr_pos2=null,curr_pos3=null,curr_pos4=null; %>
        <% try
           {
        		Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/snakes_and_ladders";
				conn=DriverManager.getConnection(url,"root","gourav");
				stmt=conn.createStatement();
        		rs=stmt.executeQuery("SELECT player_name,player_color,current_position,turn from players_details where game_name='"+game+"';");
            	int i=1; 
            	
            	while(rs.next()) 
            	{
                   if(i==1)
                   {%>
                   		<%color1= rs.getString(2);%>
                        <%curr_pos1= rs.getString(3);%>
                        <tr style="background:#c9c9c9; height:35px;"><td> <%=rs.getString(1)%></td>
                            <td> <%=rs.getString(2)%></td>
                            <td> <%=rs.getString(3)%></td>
                            <%String turn=(String)rs.getString(4);%>
                            <%String userName=(String)rs.getString(1); %>
                             <%if(turn.equalsIgnoreCase("true") && userName.equals(uname)) 
                                   {  %>
                                   <h2 style="color:blue; font-family:Georgia;">Now, It's ur Turn</h2>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="background-color:<%=color1%>; border:2px solid black; color:white; width:80px;"/></td>
                            <%} else { %>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="border:2px solid black; width:80px;" disabled/></td>
                            <%}%>
                        </tr>
                        
          
                 <%}
                   if(i==2)
                   {%>
                   		<%color2= rs.getString(2);%>
                        <%curr_pos2= rs.getString(3);%>
                        <tr style="background:#e3e3e3; height:35px;"><td> <%=rs.getString(1)%></td>
                            <td> <%=rs.getString(2)%></td>
                            <td> <%=rs.getString(3)%></td>
                            <%String turn=(String)rs.getString(4);%>
                            <%String userName=(String)rs.getString(1); %>
                             <%if(turn.equalsIgnoreCase("true") && userName.equals(uname)) 
                                   {  %>
                                   <h2 style="color:blue; font-family:Georgia;">Now, It's ur Turn</h2>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="background-color:<%=color2%>; border:2px solid black; color:white; width:80px;"/></td>
                            <%} else { %>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="border:2px solid black;width:80px;" disabled/></td>
                            <%}%>
                        </tr>
                        
                <% }
                   if(i==3)
                    {%>
                        <%color3= rs.getString(2);%>
                        <%curr_pos3= rs.getString(3);%>
                        <tr style="background:#c9c9c9; height:35px;"><td> <%= rs.getString(1)%></td>                
                            <td> <%= rs.getString(2)%></td>
                            <td> <%= rs.getString(3)%></td>
                            <%String turn=(String)rs.getString(4);%>
                            <%String userName=(String)rs.getString(1); %>
                             <%if(turn.equalsIgnoreCase("true") && userName.equals(uname)) 
                                   {  %>
                                   <h2 style="color:blue; font-family:Georgia;">Now, It's ur Turn</h2>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="background-color:<%=color1%>; border:2px solid black; color:white; width:80px;"/></td>
                            <%} else { %>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="border:2px solid black; width:80px;" disabled/></td>
                            <%}%>
                       </tr>
                       
               <% } 
                 if(i==4)
                 {%>
                 		<%color4= rs.getString(2);%>
                        <%curr_pos4= rs.getString(3);%>
                        <tr style="background:#e3e3e3; height:35px;"><td> <%= rs.getString(1)%></td> 
                            <td> <%= rs.getString(2)%></td>
                            <td> <%= rs.getString(3)%></td>
                            <%String turn=(String)rs.getString(4);%>
                            <%String userName=(String)rs.getString(1); %>
                             <%if(turn.equalsIgnoreCase("true") && userName.equals(uname)) 
                                   {  %>
                                   <h2 style="color:blue; font-family:Georgia;">Now, It's ur Turn</h2>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="background-color:<%=color1%>; border:2px solid black; color:white; width:80px;"/></td>
                            <%} else { %>
                            	 <td><input type="button" value="Roll Dice" id="b1" onclick="return rollDice()" style="border:2px solid black; width:80px;" disabled/></td>
                            <%}%>
                       </tr>
                       
               <% } i++; %> 
               
            <% }
               rs.close();
     		   stmt.close();
     		   conn.close();
        }
        catch(Exception e)
        {
        	e.printStackTrace(); 
        }%>
    </table>
    <script>
            function diceimage()
            {
            	document.getElementById("<%=curr_pos1%>").innerHTML="<div style='background-color:<%=color1%>;width:10px;height:10px;'></div>";
            	document.getElementById("<%=curr_pos2%>").innerHTML="<div style='background-color:<%=color2%>;width:10px;height:10px;'></div>";
            	document.getElementById("<%=curr_pos3%>").innerHTML="<div style='background-color:<%=color3%>;width:10px;height:10px;'></div>";
            	document.getElementById("<%=curr_pos4%>").innerHTML="<div style='background-color:<%=color4%>;width:10px;height:10px;'></div>";
            }
     </script>
    </div>
    </center>
    </form>
   </div>
</div>
</div>
</div>
</body>
</html>