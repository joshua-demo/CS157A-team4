<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Tasks</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans">

<div class="container mx-auto p-6">
    <h1 class="text-3xl font-bold text-gray-800 mb-6">Manage My Tasks</h1>

    <!-- Task Addition Form -->
    <div class="bg-white shadow-md rounded-lg p-6 mb-6">
        <h2 class="text-2xl font-semibold text-gray-700 mb-4">Add New Task</h2>
        <form action="UAddTask" method="post" class="space-y-4">
            <div>
                <label for="taskName" class="block text-gray-600">Task Name:</label>
                <input type="text" id="taskName" name="taskName" required 
                       class="mt-1 block w-full border border-gray-300 rounded-md p-2" placeholder="Enter task name">
            </div>

            <div>
                <label for="description" class="block text-gray-600">Description:</label>
                <textarea id="description" name="description" rows="4" required 
                          class="mt-1 block w-full border border-gray-300 rounded-md p-2" placeholder="Enter task description"></textarea>
            </div>

            <div>
                <label for="dueDate" class="block text-gray-600">Due Date:</label>
                <input type="date" id="dueDate" name="dueDate" required 
                       class="mt-1 block w-full border border-gray-300 rounded-md p-2">
            </div>

            <div>
                <label for="priority" class="block text-gray-600">Priority:</label>
                <select id="priority" name="priority" required 
                        class="mt-1 block w-full border border-gray-300 rounded-md p-2">
                    <option value="Low">Low</option>
                    <option value="Medium">Medium</option>
                    <option value="High">High</option>
                </select>
            </div>

            <div>
                <label for="status" class="block text-gray-600">Status:</label>
                <select id="status" name="status" required 
                        class="mt-1 block w-full border border-gray-300 rounded-md p-2">
                    <option value="Pending">Pending</option>
                    <option value="Completed">Completed</option>
                    <option value="Overdue">Overdue</option>
                </select>
            </div>

            <div>
                <label for="type" class="block text-gray-600">Type:</label>
                <select id="status" name="status" required 
                        class="mt-1 block w-full border border-gray-300 rounded-md p-2">
                    <option value="Pending">Group Project</option>
                    <option value="Completed">Assignment</option>
                </select>
            </div>

            <button type="submit" 
                    class="w-full bg-blue-500 text-white font-semibold rounded-md p-2 hover:bg-blue-600 transition duration-200">
                Add Task
            </button>
        </form>
    </div>

    <!-- Display User's Tasks -->
    <h2 class="text-2xl font-semibold text-gray-700 mb-4">My Tasks</h2>
		<!-- Button to refresh the task list -->
		<form action="UViewTask" method="get">
			<button type="submit" class="mb-4 bg-blue-500 text-white font-bold py-2 px-4 rounded">
					Refresh Task List
			</button>
		</form>
    <c:if test="${empty taskList}">
        <p class="text-gray-600">No tasks found. Add a new task to get started!</p>
    </c:if>

    <c:if test="${not empty taskList}">
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white shadow-md rounded-lg">
                <thead>
                    <tr class="bg-gray-200 text-gray-600">
                        <th class="py-2 px-4">Task Name</th>
                        <th class="py-2 px-4">Description</th>
                        <th class="py-2 px-4">Due Date</th>
                        <th class="py-2 px-4">Priority</th>
                        <th class="py-2 px-4">Status</th>
                        <th class="py-2 px-4">Type</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="task" items="${taskList}">
                        <tr class="border-b hover:bg-gray-100">
                            <td class="py-2 px-4">${task.taskName}</td>
                            <td class="py-2 px-4">${task.description}</td>
                            <td class="py-2 px-4">${task.dueDate}</td>
                            <td class="py-2 px-4">${task.priority}</td>
                            <td class="py-2 px-4">${task.status}</td>
                            <td class="py-2 px-4">${task.type}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

</body>
</html>
