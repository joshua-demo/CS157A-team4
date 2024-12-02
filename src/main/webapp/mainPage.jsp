<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudySmart - Your Ultimate Study Companion</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
</head>
<body class="font-[Poppins] bg-gray-100">
    <header class="bg-white shadow-sm">
        <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
            <div class="flex items-center">
                <svg class="h-8 w-8 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                </svg>
                <span class="ml-2 text-2xl font-bold text-gray-800">StudySmart</span>
            </div>
            <div class="hidden md:flex items-center space-x-4">
                <a href="#features" class="text-gray-600 hover:text-blue-600 transition duration-300">Features</a>
                <a href="#about" class="text-gray-600 hover:text-blue-600 transition duration-300">About</a>
                <a href="#contact" class="text-gray-600 hover:text-blue-600 transition duration-300">Contact</a>
            </div>
            <div class="flex items-center space-x-4">
                <a href="loginPage.jsp" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition duration-300">Login</a>
                <a href="userRegister.jsp" class="px-4 py-2 bg-white text-blue-600 border border-blue-600 rounded-md hover:bg-blue-50 transition duration-300">Register</a>
            </div>
        </nav>
    </header>

    <main>
        <section class="bg-gradient-to-br from-blue-400 to-blue-600 text-white py-20">
            <div class="container mx-auto px-6 text-center">
                <h1 class="text-4xl md:text-6xl font-bold mb-4">Welcome to StudySmart</h1>
                <p class="text-xl mb-8">Your ultimate study companion for academic success!</p>
                <a href="userRegister.jsp" class="bg-white text-blue-600 px-6 py-3 rounded-md font-semibold hover:bg-blue-50 transition duration-300">Get Started</a>
            </div>
        </section>

        <section id="features" class="py-20 bg-white">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">Features</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="text-center">
                        <i data-feather="calendar" class="mx-auto text-blue-600 mb-4"></i>
                        <h3 class="text-xl font-semibold mb-2">Task Organization</h3>
                        <p class="text-gray-600">Efficiently manage your tasks and deadlines</p>
                    </div>
                    <div class="text-center">
                        <i data-feather="book-open" class="mx-auto text-blue-600 mb-4"></i>
                        <h3 class="text-xl font-semibold mb-2">Course Management</h3>
                        <p class="text-gray-600">Keep track of all your courses in one place</p>
                    </div>
                    <div class="text-center">
                        <i data-feather="trending-up" class="mx-auto text-blue-600 mb-4"></i>
                        <h3 class="text-xl font-semibold mb-2">Progress Tracking</h3>
                        <p class="text-gray-600">Monitor your academic progress over time</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="about" class="py-20 bg-gray-100">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">About StudySmart</h2>
                <p class="text-gray-600 text-center max-w-2xl mx-auto">
                    StudySmart is designed to help students organize their studying, manage tasks, track courses, and monitor progress. Our goal is to provide a comprehensive tool that facilitates all your academic needs in one convenient platform.
                </p>
            </div>
        </section>

        <section id="contact" class="py-20 bg-white">
            <div class="container mx-auto px-6 text-center">
                <h2 class="text-3xl font-bold text-gray-800 mb-8">Contact Us</h2>
                <p class="text-gray-600 mb-8">Have questions or feedback? We'd love to hear from you!</p>
                <a href="mailto:support@studysmart.com" class="bg-blue-600 text-white px-6 py-3 rounded-md font-semibold hover:bg-blue-700 transition duration-300">Get in Touch</a>
            </div>
        </section>
    </main>

    <footer class="bg-gray-800 text-white py-8">
        <div class="container mx-auto px-6 text-center">
            <p>&copy; 2023 StudySmart. All rights reserved.</p>
        </div>
    </footer>

    <script>
        feather.replace()
    </script>
</body>
</html>

