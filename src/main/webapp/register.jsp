<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Employee</title>
</head>
<style>
      
body{
    background-image:url("bgimg3.jpg");
    background-repeat:no-repeat;
    background-size:1920px 1080px;
    }
/* form {border: 1px solid #f1f1f1;}
 */	
	label {
		display:block; 
		text-align:left;
		}
    
    input[type=text]{
    	width: 30%;
        padding: 12px 20px;
        margin: 5px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
        /* float:left; */
    }
    input[type=password] {
        width: 30%;
        padding: 12px 20px;
        margin: 5px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
        float:left;
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
        width: 20%;
    }
</style>
<body>
	<form action="${pageContext.request.contextPath}/Register" method="post">
		<div class="imgcontainer">
            <img src="aaa.png" alt="Logo Is Under Updation" class="avatar">
        </div>
 
	<div class="container">
            <H3><label>Employee ID </label>
            <input type="text" placeholder="Enter Employee ID" name="id" required></H3>
  
            <h3><label> Name </label>
            <input type="text" placeholder="Enter Employee Name" name="name" required></h3>
  			
  			<h3><label> Email </label>
            <input type="text" placeholder="Enter Employee EmailID/ User Email" name="email" required></h3>
  			
  			<h3><label> Password </label>
            <input type="text" placeholder="Enter User Password" name="password" required></h3>
  			
  			<h3><label> Salary </label>
            <input type="text" placeholder="Enter Salary" name="salary" required></h3>
  			
            <button type="submit">Create User</button>
		</div>
	
		</form> 
	</body>
</html>