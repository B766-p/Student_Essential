<%-- 
    Document   : fileup1
    Created on : 02-Apr-2024, 14:09:30
    Author     : DELL
--%>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String year1 = request.getParameter("year");
    String batch1 = request.getParameter("batch");
    String type1 = request.getParameter("type");

    session.setAttribute("year", year1);
    session.setAttribute("batch", batch1);
    session.setAttribute("type", type1);
%>
<!DOCTYPE html>
<html>
<head>
    <title>File Upload Form</title>
    <script src="https://cdn.jsdelivr.net/npm/compressorjs@1.0.7/dist/compressor.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="file"] {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 14px;
            color: #495057;
            width: 100%;
            box-sizing: border-box;
            outline: none;
        }

        input[type="file"]:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>File Upload Form</h1>
        <form action="f1.jsp" method="post" enctype="multipart/form-data" >
            <label for="file">Select a file to upload come under 10 mb:</label>
            <input type="file" id="file" name="file" required><br><br>
            <input type="submit" value="Upload File">
        </form>
    </div>
    
  
</body>
</html>
