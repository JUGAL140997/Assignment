<%@page import="com.org.beans.Emp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Update</title>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 2px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child {
	background-color: #dddddd;
}
body{
    background-image:url("bgimg3.jpg");
    background-repeat:no-repeat;
    background-size:1920px 1080px;
    }
        .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }
      
    img.avatar {
        width: 35%;
    }
    
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        text-align: center;
        width: 100%;
    }
      
     button:hover {
        opacity: 0.8;
    }
    
    #delete{
    	background-color: RED;
    }
    
</style>
</head>
<body>
	<%
		Object objEmp = session.getAttribute("emp");
		Emp emp = null;
		if (objEmp != null) {
			emp = (Emp) objEmp;
			session.setAttribute("emp", emp);
		}

		if (emp == null) {
			session.setAttribute("error", "Please login Before Continue");
			request.getRequestDispatcher("index.jsp").forward(request, response);

		}

		Object list = request.getSession().getAttribute("empList");
		List<Emp> listEmp = (List<Emp>) list;

		Object message = session.getAttribute("message");
		if (message != null) {
			out.println("<font color='green' size='5' >" + message + "</font>");
			session.removeAttribute("message");
		}
		Object error = session.getAttribute("error");
		if (error != null) {
			out.println("<font color='red' size='5' >" + error + "</font>");
			session.removeAttribute("error");
		}
	%>
	<H2>
		Welcome to Home
		<%=emp.getName()%>
		<a href="${pageContext.request.contextPath}/updated_current_user.jsp">Click Here For Profile Update</a>
	</H2>
		<div class="imgcontainer">
            <img src="aaa.png" alt="Logo Is Under Updation" class="avatar">
        </div>
	
	<c:set var="currentUser" value="<%=emp%>"></c:set>
	<c:set var="listEmp" value="<%=listEmp%>"></c:set>

	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>View Details</th>
			<c:if test="${currentUser.getPermission().equals('admin') }">
				<th>Update</th>
				<th>Delete</th>
			</c:if>


		</tr>
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${listEmp }" var="emp">

			<tr>
				<td><c:out value="${emp.getId()}" /></td>
				<td><c:out value="${emp.getName()}" /></td>
				<td><c:out value="${emp.getEmail()}" /></td>
				<td><a
					href="${pageContext.request.contextPath}/update.jsp?edit=false&&index=${count}&&currentUser=false"><button>View
							Details</button></a></td>

				<c:if test="${currentUser.getPermission().equals('admin') }">

					<td><a
						href="${pageContext.request.contextPath}/update.jsp?edit=true&&index=${count}&&currentUser=false"><button>Edit Details</button></a></td>
					<td><a
						href="${pageContext.request.contextPath}/Delete?id=${emp.getId()}"><button id="delete">Delete
								</button></a></td>
				</c:if>

			</tr>
			<c:set var="count" value="${count + 1}" scope="page" />
		</c:forEach>
	</table>
	<h1><a href="${pageContext.request.contextPath}/LogOut">LOG OUT</a></h1>
</body>
</html>