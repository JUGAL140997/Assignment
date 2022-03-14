<%@page import="com.org.beans.Emp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Details</title>
</head>
<style>
body{
    background-image:url("bgimg3.jpg");
    background-repeat:no-repeat;
    background-size:1920px 1080px;
    }

	label {
		display:block; 
		text-align:left;
		}


    input[type=number],[type=text]{
        width: 30%;
        padding: 12px 20px;
        margin: 5px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
        float:left;
        }
      
    input[type=submit] {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        text-align: center;
        width: 25%;
    }
      
     input[type=submit] {
        opacity: 0.8;
    }
        .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }
      
    img.avatar {
        width: 18%;
    }
</style>
<body>
	<h2>Profile Details</h2>
	<%
		Object objEmp = session.getAttribute("emp");
		Emp emp = null;
		boolean isAdmin = false;
		if (objEmp != null) {
			emp = (Emp) objEmp;
			session.setAttribute("emp", emp);
			isAdmin = emp.getPermission().equals("admin");
		}

		if (emp == null) {
			session.setAttribute("error", "Please login Before Continue");
			request.getRequestDispatcher("index.jsp").forward(request, response);

		}

		Object list = request.getSession().getAttribute("empList");
		List<Emp> listEmp = (List<Emp>) list;
		
		Emp updateUser = listEmp.get(Integer.parseInt(request.getParameter("index")));
		System.out.println("updateUser : " + updateUser);
		boolean edit=Boolean.parseBoolean(request.getParameter("edit"));
	%>
	<br>
	<form action="${pageContext.request.contextPath}/Update"
		method="post">
		<div class="imgcontainer">
            <img src="aaa.png" alt="Logo Is Under Updation" class="avatar">
        </div>
		<H3><label>Employee ID </label>
            <input type="number" value="<%=updateUser.getId()%>" name="id" disabled></H3>
            <br>
			
		<c:if test="<%=isAdmin && edit %>">
			<H3><label>Employee Name </label>
            <input type="text" value="<%=updateUser.getName()%>" name="name"></H3>
			<br>
			
			<H3><label>Employee Email ID </label>
            <input type="text" name="email" value="<%=updateUser.getEmail()%>"></H3>
			<br>
			
			<H3><label>Password </label>
            <input type="text" name="password" value="<%=updateUser.getPassword()%>" ></H3>
			<br>
			 
 			<H3><label>Salary </label>
            <input type="text" name="salary" value="<%=updateUser.getSalary()%>" ></H3>
			<br>
			
 			
		</c:if>
		
		<c:if test="<%=!isAdmin  || !edit%>">
			
			<H3><label>Employee Name </label>
            <input type="text" value="<%=updateUser.getName()%>" name="name" disabled="false"></H3>
			<br>
			
			<H3><label>Employee Email ID </label>
            <input type="text" name="email" value="<%=updateUser.getEmail()%>" disabled="true"></H3>
			<br>
			
			<H3><label>Password </label>
            <input type="text" name="password" value="<%=updateUser.getPassword()%>" disabled="false"></H3>
			<br>
			 
 			<H3><label>Salary </label>
            <input type="text" name="salary" value="<%=updateUser.getSalary()%>" disabled="true"></H3>
			<br>
			
 			
		</c:if>

		<c:if test="<%=isAdmin  && edit%>">
			<br> <input type="submit" value="Update Details">
		</c:if>
				<input type="text" value="false" name="current_user" style="display: none"  />
		
	</form>

</body>
</html>