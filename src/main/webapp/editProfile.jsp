<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.studysmart.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <h1 class = "text-3xl font-bold">Edit Profile</h1>
    <% 
        // Retrieve the User object from session
        User user = (User) session.getAttribute("user");

         if (user == null) {
            // If no user found in session, redirect to login page
            response.sendRedirect("loginPage.jsp");
         } else { 
    %>
    <form action="UpdateProfile" method="post" class="space-y-4">
            <div>
                <label for="username" class="block text-m font-medium text-gray-700">Username</label>
                <input type="text" id="username" name="username" placeholder="<%= user.getuser_id() %>"
                       class="mt-1 block px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
                <label for="password" class="block text-m font-medium text-gray-700">Password</label>
                <input type="password" id="password" name="password" placeholder="<%= user.getPassword() %>"
                       class="mt-1 block px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
                <label for="password" class="block text-m font-medium text-gray-700">Confirm Password</label>
                <input type="password" id="passwordConfirm" name="passwordConfirm"
                       class="mt-1 block px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
                <label for="email" class="block text-m font-medium text-gray-700">Email</label>
                <input type="text" id="email" name="email" placeholder="<%= user.getEmail() %>"
                       class="mt-1 block px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
                <button type="submit" 
                        class="flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                    Save Changes
                </button>
            </div>
        </form>
    <% 
        }
    %>

</body>
</html>