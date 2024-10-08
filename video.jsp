<%-- 
    Document   : video
    Created on : 02-Apr-2024, 14:03:24
    Author     : DELL
--%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 500px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    form label {
        display: block;
        margin-bottom: 5px;
    }

    form input[type="text"],
    form input[type="email"],
    form select {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    form input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    form input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <h2> Add video lecture</h2>
    <form action="fileup1.jsp" method="post">
        <label for="year">name of the doc:</label>
        <input type="text" id="year" name="year" required><br><br>
        
        <label for="batch">Batch:</label>
        <select id="batch" name="batch">
            <option value="">Select Batch (Optional)</option>
            <option value="1">1st year</option>
            <option value="2">2nd year</option>
            <option value="3">3rd year</option>
             <option value="4">4th year</option>
        </select><br><br>
        
        <label for="type">Type:</label>
    <select id="type" name="type">
    <option value="">Select Type</option>
    <option value="computer_basics">Computer Basics</option>
    <option value="programming">Programming</option>
     <option value="c">c Programming</option>
      <option value="java">java Programming</option>
       <option value="c++">c Programming</option>
      <option value="python">python Programming</option>
    <option value="web_development">Web Development</option>
    <option value="database_management">Database Management</option>
    <option value="networking">Networking</option>
    <option value="cyber_security">Cyber Security</option>
    <option value="data_science">Data Science</option>
    <option value="artificial_intelligence">Artificial Intelligence</option>
    <option value="machine_learning">Machine Learning</option>
    <option value="cloud_computing">Cloud Computing</option>
</select><br><br>
<br><br>
        
        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>