<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            line-height: 1.6;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .profile-picture-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .profile-info {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .profile-info label {
            width: 150px;
            font-weight: bold;
        }
        .profile-info span {
            flex-grow: 1;
        }
        .profile-info button,
        #change-picture {
            margin-left: 10px;
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .profile-info button:hover,
        #change-picture:hover {
            background-color: #0056b3;
        }
        .blurred {
            filter: blur(4px);
        }
        #file-input {
            display: none;
        }
        .eye-icon {
            font-size: 1.2em;
            line-height: 1;
        }
        #toggle-password-visibility {
            background: none;
            border: none;
            cursor: pointer;
            padding: 0 5px;
        }
        .home-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .home-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>My Profile</h1>
    
    <div class="profile-picture-container">
        <img src="/placeholder.svg?height=150&width=150" alt="Profile Picture" id="profile-picture" class="profile-picture">
        <br>
        <button id="change-picture">Change Profile Picture</button>
        <input type="file" id="file-input" accept="image/*">
    </div>
    
    <div class="profile-info">
        <label for="username">Username:</label>
        <span id="username">Temp</span>
        <button onclick="changeField('username')">Change</button>
    </div>
    
    <div class="profile-info">
        <label for="password">Password:</label>
        <span id="password" class="blurred">********</span>
        <button id="toggle-password-visibility" aria-label="Toggle password visibility">
            <span class="eye-icon">👁️</span>
        </button>
        <button onclick="changeField('password')">Change</button>
    </div>
    
    <div class="profile-info">
        <label for="email">Email:</label>
        <span id="email">temporary@example.com</span>
        <button onclick="changeField('email')">Change</button>
    </div>
    
    <div class="profile-info">
        <label for="created-date">Profile Created:</label>
        <span id="created-date"><%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%></span>
    </div>

    <script>
        function changeField(field) {
            const newValue = prompt(`Enter new ${field}:`);
            if (newValue !== null && newValue !== "") {
                document.getElementById(field).textContent = field === 'password' ? '*'.repeat(newValue.length) : newValue;
            }
        }

        document.getElementById('change-picture').addEventListener('click', function() {
            document.getElementById('file-input').click();
        });

        document.getElementById('file-input').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('profile-picture').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });

        document.getElementById('toggle-password-visibility').addEventListener('click', function() {
            const passwordSpan = document.getElementById('password');
            if (passwordSpan.classList.contains('blurred')) {
                passwordSpan.classList.remove('blurred');
                this.setAttribute('aria-label', 'Hide password');
            } else {
                passwordSpan.classList.add('blurred');
                this.setAttribute('aria-label', 'Show password');
            }
        });
    </script>
    <div style="text-align: center; margin-top: 20px;">
        <a href="homePage.jsp" class="home-button">Back to Home</a>
    </div>
</body>
</html>