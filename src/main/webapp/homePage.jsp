<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <header class="bg-blue-600 text-white p-6 text-center">
        <h1 class="text-4xl font-bold" id="study-smart">StudySmart</h1>
        <h2 class="text-xl mt-2" id="home-page">Home Page</h2>
    </header>

    <main class="max-w-4xl mx-auto mt-8 p-6 bg-white rounded-lg shadow-md">
        <section class="mb-6">
            <a href="myProfile.jsp">
                <button class="w-full bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded">
                    My Profile
                </button>
            </a>
        </section>

        <section class="mb-6">
            <a href="myCourses.jsp">
                <button class="w-full bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded">
                    My Courses
                </button>
            </a>
        </section>

        <section class="mb-6">
            <a href="myStudySessions.jsp">
                <button class="w-full bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded">
                    My Study Sessions
                </button>
            </a>
        </section>

        <section class="mb-6">
            <a href="myExtracurriculars.jsp">
                <button class="w-full bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded">
                    My Extracurriculars
                </button>
            </a>
        </section>

        <section>
            <a href="myTask.jsp">
                <button class="w-full bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded">
                    My Tasks
                </button>
            </a>
        </section>
    </main>
</body>
</html>
