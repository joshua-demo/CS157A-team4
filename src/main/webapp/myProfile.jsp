<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.studysmart.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudySmart - User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .alert-success {
            border: 2px solid green;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen">
    	<% if (request.getParameter("success") != null) { %>
          	  <div class="alert alert-success" role="alert">
          	      Profile Updated Successfully!
          	  </div>
        <% } %>
        <header>
            <h1 class="text-3xl font-bold text-blue-600">User Profile</h1>
        </header>
    	<% 
        	// Retrieve the User object from session
        	User user = (User) session.getAttribute("user");

        	 if (user == null) {
         	   // If no user found in session, redirect to login page
         	   response.sendRedirect("loginPage.jsp");
         	} else { 
   		%>
   	    	<p class = "mt-1 block px-3 py-2"><strong>Name:</strong> <%= user.getName() %></p>
        	<p class = "mt-1 block px-3 py-2"><strong>Email:</strong> <%= user.getEmail() %></p>        	
        	<p class = "mt-1 block px-3 py-2"><strong>Password:</strong> <%= user.getPassword() %></p>
        	<form action="editProfile.jsp" method="post">
            <button type="submit" class="btn mt-1 block px-3 py-2 bg-blue-600 text-white border-black hover:bg-blue-700">Edit Profile</button>
        	</form>
        	<form action="ULogout" method="post">
            	<button type="submit" class="btn btn-danger mt-1 block px-3 py-2 border-black hover:bg-red-700">Logout</button>
        	</form>
    	<% 
        }
    %>
</body>
</html>