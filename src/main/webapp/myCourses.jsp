<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses Section</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h1, h2 {
            color: #2c3e50;
            text-align: center;
        }

        #course-input {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        #course-form {
            display: grid;
            gap: 10px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }

        #courses-list {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        @media (max-width: 600px) {
            body {
                padding: 10px;
            }
            
            #course-form {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <section id="course-input">
        <h1>Add your Courses</h1>
        <form id="course-form">
            <label for="courseName">Course name:</label>
            <input type="text" id="courseName" placeholder="e.g., CS157a" required>
            
            <label for="instructor">Instructor</label>
            <input type="text" id="instructor" placeholder="e.g., Dr. Wu" required>

            <label for="startDate">Start Date</label>
            <input type="date" id="startDate" required>

            <label for="endDate">End Date</label>
            <input type="date" id="endDate" required>

            <button type="button" onclick="addCourses()">Add Course</button>
        </form>
    </section>

    <h2>My Courses</h2>

    <section id="courses-list">
        <table id="coursesTable">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Instructor</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Table body will be populated by js -->
            </tbody>
        </table>
    </section>

    <script src="courseScript.js"></script>
</body>
</html>