<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.studysmart.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
</head>
<body>
    <h1>User Profile</h1>
    <% 
        // Retrieve the User object from session
        User user = (User) session.getAttribute("user");

         if (user == null) {
            // If no user found in session, redirect to login page
            response.sendRedirect("loginPage.jsp");
         } else { 
    %>
        <p><strong>Username:</strong> <%= user.getuser_id() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Password:</strong> <%= user.getPassword() %></p>
        <form action="editProfile.jsp" method="post">
            <button type="submit" class="btn btn-danger">Edit Profile</button>
        </form>

        <!-- Optionally, include a logout button -->
        <form action="ULogout" method="post">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    <% 
        }
    %>
</body>
</html>