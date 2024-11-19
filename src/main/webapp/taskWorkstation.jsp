<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Workstation</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <!-- Navigation Bar -->
    <nav class="bg-white shadow-lg">
        <div class="max-w-6xl mx-auto px-4">
            <div class="flex justify-between">
                <div class="flex space-x-7">
                    <div class="flex items-center py-4">
                        <span class="font-semibold text-gray-500 text-lg">Task Workstation</span>
                    </div>
                </div>
                <div class="flex items-center">
                    <a href="myTask.jsp" class="py-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300">Back to Tasks</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto p-6">
        <!-- Task Details Section -->
        <div class="bg-white rounded-lg shadow-md p-6 mb-6">
            <div class="flex justify-between items-center mb-4">
                <h1 class="text-2xl font-bold text-gray-800">${task.taskName}</h1>
                <span class="px-3 py-1 rounded-full text-sm ${task.status eq 'Completed' ? 'bg-green-200 text-green-800' : task.status eq 'Overdue' ? 'bg-red-200 text-red-800' : 'bg-yellow-200 text-yellow-800'}">
                    ${task.status}
                </span>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                <div>
                    <p class="text-gray-600"><strong>Due Date:</strong> ${task.dueDate}</p>
                    <p class="text-gray-600"><strong>Priority:</strong> 
                        <span class="px-2 py-1 rounded-full text-xs ${task.priority eq 'High' ? 'bg-red-200 text-red-800' : task.priority eq 'Medium' ? 'bg-yellow-200 text-yellow-800' : 'bg-green-200 text-green-800'}">
                            ${task.priority}
                        </span>
                    </p>
                    <p class="text-gray-600"><strong>Type:</strong> ${task.type}</p>
                </div>
                <div class="bg-gray-50 p-4 rounded-lg">
                    <h3 class="font-semibold text-gray-700 mb-2">Description</h3>
                    <p class="text-gray-600">${task.description}</p>
                </div>
            </div>
        </div>

        <!-- Task Progress Section -->
        <div class="bg-white rounded-lg shadow-md p-6 mb-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Progress Tracking</h2>
            <!-- Add your progress tracking components here -->
            <div class="space-y-4">
                <div class="flex items-center">
                    <div class="flex-1">
                        <div class="h-2 bg-gray-200 rounded-full">
                            <div class="h-full bg-blue-500 rounded-full" style="width: ${task.status eq 'Completed' ? '100' : '50'}%"></div>
                        </div>
                    </div>
                    <span class="ml-4 text-sm text-gray-600">
                        ${task.status eq 'Completed' ? '100' : '50'}%
                    </span>
                </div>
            </div>
        </div>

        <!-- Notes Section -->
        <div class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Notes</h2>
            <div class="mb-4">
                <textarea class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                          rows="4" 
                          placeholder="Add your notes here..."></textarea>
            </div>
            <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300">
                Save Notes
            </button>
        </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get taskId from URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        const taskId = urlParams.get('taskId');
        
        if (taskId) {
            // You can add AJAX call here to fetch task details if needed
            console.log('Loading task:', taskId);
        }
    });
    </script>
</body>
</html>