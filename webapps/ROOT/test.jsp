<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to TEST</title>
</head>
<body>
    <h1>Welcome to TEST 10</h1>
    <p>The current time (JSP) is: <%= new java.util.Date() %></p>
    <button onclick="fetchTime()">Get Time from Express</button>
    <p>The current time (Express) is: <span id="expressTime"></span></p>
</body>
<script>
        function fetchTime() {
            fetch('http://localhost:3000/api/time')
                .then(response => response.json())
                .then(data => {
                    document.getElementById('expressTime').textContent = data.time;
                });
        }
    </script>
</html>
