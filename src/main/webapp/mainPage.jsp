<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to StudySmart</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-400 to-blue-600">
    <div class="bg-white p-8 rounded-lg shadow-md w-96 text-center">
        <h1 class="text-3xl font-bold text-blue-600 mb-6">Welcome to StudySmart</h1>
        
        <p class="text-gray-600 mb-8">Your ultimate study companion for academic success!</p>
        
        <div class="space-y-4">
            <a href="loginPage.jsp" class="block w-full py-2 px-4 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition duration-300">
                Login
            </a>
            <a href="userRegister.jsp" class="block w-full py-2 px-4 bg-white text-blue-600 border border-blue-600 rounded-md hover:bg-blue-50 transition duration-300">
                Register
            </a>
        </div>
    </div>
</body>
</html>