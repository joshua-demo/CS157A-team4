<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        #courseList {
            list-style-type: none;
            padding: 0;
        }
        #courseList li {
            background-color: #f4f4f4;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
        }
        input {
            margin-bottom: 10px;
            padding: 5px;
        }
    </style>
</head>
<body>
    <section>
        <h1>Current Courses</h1>
        <ul id="courseList">
            <!-- Courses will be added here dynamically -->
        </ul>
        <button id="addCourseBtn">Add Course</button>
    </section>

    <div id="addCourseModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Add New Course</h2>
            <form id="addCourseForm">
                <label for="courseName">Course Name:</label>
                <input type="text" id="courseName" required>

                <label for="instructor">Instructor:</label>
                <input type="text" id="instructor" required>

                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" required>

                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" required>

                <button type="submit">Add Course</button>
            </form>
        </div>
    </div>

    <script>
        // Get the modal
        var modal = document.getElementById("addCourseModal");

        // Get the button that opens the modal
        var btn = document.getElementById("addCourseBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // Handle form submission
        document.getElementById("addCourseForm").onsubmit = function(e) {
            e.preventDefault();
            var courseName = document.getElementById("courseName").value;
            var instructor = document.getElementById("instructor").value;
            var startDate = document.getElementById("startDate").value;
            var endDate = document.getElementById("endDate").value;

            // Create new list item
            var li = document.createElement("li");
            li.innerHTML = '<strong>${courseName}</strong> - Instructor: ${instructor}, Start Date: ${startDate}, End Date: ${endDate}';
            document.getElementById("courseList").appendChild(li);

            // Clear form and close modal
            this.reset();
            modal.style.display = "none";
        }
    </script>
</body>
</html>