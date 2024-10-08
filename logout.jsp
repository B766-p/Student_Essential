<%-- 
    Document   : logout
    Created on : 02-Apr-2024, 21:29:51
    Author     : DELL
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Invalidate the current session
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .card h1 {
            margin-top: 0;
            color: #333;
        }
        .card p {
            color: #555;
        }
        .card a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Logout Successful</h1>
        <p>You have been logged out.</p>
        <p><a href="index.html">Login</a></p>
    </div>
    <!-- Disable back button -->
    <script>
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>
</body>
</html>
