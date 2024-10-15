<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>StudySmart - Home</title>
</head>
<body>
    <%@ include file="header.jsp" %> <!-- Including the header -->

    <div>
        <!-- Page content goes here -->
        <h2>Welcome to StudySmart</h2>
        <form action="TaskServlet" method="POST">
            <label for="task_name">Task Name:</label>
            <input type="text" id="task_name" name="task_name" required><br>
        
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" cols="50" required></textarea><br>
        
            <label for="due_date">Due Date:</label>
            <input type="date" id="due_date" name="due_date" required><br>
        
            <label for="priority">Priority:</label>
            <select id="priority" name="priority">
                <option value="Low">Low</option>
                <option value="Medium">Medium</option>
                <option value="High">High</option>
            </select><br>
        
            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="Pending">Pending</option>
                <option value="Completed">Completed</option>
                <option value="Overdue">Overdue</option>
            </select><br>
        
            <label for="type">Type:</label>
            <input type="text" id="type" name="type" required><br>
        
            <button type="submit" name="action" value="addTask">Add Task</button>
        </form>
        
        <form action="NoteServlet" method="POST">
            <button type="submit" name="action" value="addNote">Add a note</button>
        </form>
        <form action="TaskServlet" method="GET">
            <button type="submit" name="action" value="viewTasks">View tasks</button>
        </form>
    </div>
</body>
</html>
