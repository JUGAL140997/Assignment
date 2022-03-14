<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<style>
      
    body{
    background-image:url("bgimg3.jpg");
    background-repeat:no-repeat;
    background-size:1920px 1080px;
    }
    
    input[type=text],
    input[type=password] {
        width: 45%;
        padding: 12px 20px;
        margin: 5px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
      
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        text-align: center;
        width: 25%;
    }
      
     button:hover {
        opacity: 0.8;
    }
      
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }
      
    img.avatar {
        width: 38%;
    }

</style>

<body>
	<h1>Welcome to Login Page</h1>
	<%
		Object message=session.getAttribute("message");
		if(message!=null){
			out.println("<font color='green' size='5' >"+message+"</font>");
		}
		Object error=session.getAttribute("error");
		if(error!=null){
			out.println("<font color='red' size='5' >"+error+"</font>");
		}
		session.invalidate();
	%>
	
	<form action="Login" method="post" >
		<div class="imgcontainer">
            <img src="aaa.png" alt="Logo Is Under Updation" class="avatar">
        </div>
 
   	
        <div class="container">
            <H3><label>Username</label>
            <input type="text" placeholder="Enter Username" name="email" required></H3>
  
            <h3><label>Password</label>
            <input type="password" placeholder="Enter Password" name="password" required></h3>
  			
            <button type="submit">Login</button>
		</div>
	</form>
	  
	<form action="${pageContext.request.contextPath}/register.jsp">
		<button type="submit" >NEW USER SIGN UP</button>
	</form>

</body>
</html>



