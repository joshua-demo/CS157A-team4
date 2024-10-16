<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Navbar</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <nav class="bg-blue-400 p-4">
        <div class="container mx-auto flex justify-between items-center">
        <div class="text-white font-bold">StudySmart</div>
            <div class="flex justify-end space-x-8">
                <a href="homepage.jsp" class="text-white hover:text-black px-3 py-2 rounded">Home</a>
                <a href="myCourses.jsp" class="text-white hover:text-black px-3 py-2 rounded">My Courses</a>
                <a href="myExtracurriculars.jsp" class="text-white hover:text-black px-3 py-2 rounded">My Extracurriculars</a>
                <a href="myStudySessions.jsp" class="text-white hover:text-black px-3 py-2 rounded">My Study Sessions</a>
                <a href="myProfile.jsp" class="text-white hover:text-black px-3 py-2 rounded">My Profile</a>
            </div>
        </div>
    </nav>
</body>
</html>
