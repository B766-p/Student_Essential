<%-- 
    Document   : job
    Created on : 31-Mar-2024, 21:45:01
    Author     : DELL
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Opportunity Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="url"],
    textarea,
    input[type="date"],
    input[type="submit"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="radio"] {
        margin-right: 10px;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .circle-image {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
        margin-right: 20px;
    }

    .circle-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }

        .alert-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
</style>
</head>
<body>

<div class="container">
    <div class="circle-image">
        <img src="job.webp" alt="Circular Image">
    </div>
    <h1>Job Opportunity Form</h1>
    <form action="#" method="post">
        <label for="job_title">Job Title:</label>
        <input type="text" id="job_title" name="job_title" required>

        <label for="company_name">Company Name:</label>
        <input type="text" id="company_name" name="company_name" required>

        <label for="location">Location:</label>
        <input type="text" id="location" name="location" required>

        <label for="job_description">Job Description:</label>
        <textarea id="job_description" name="job_description" required></textarea>

        <label>Job Type:</label>
        <label><input type="radio" name="job_type" value="on_campus" required> On Campus</label>
        <label><input type="radio" name="job_type" value="off_campus" required> Off Campus</label>

        <label for="deadline">Application Deadline:</label>
        <input type="date" id="deadline" name="deadline" required>

        <label for="apply_link">Apply Link:</label>
        <input type="url" id="apply_link" name="apply_link" required>

        <input type="submit" value="Submit">
    </form>

  
    <%
    try {
        String jobTitle = request.getParameter("job_title");
        String companyName = request.getParameter("company_name");
        String location = request.getParameter("location");
        String jobDescription = request.getParameter("job_description");
        String jobType = request.getParameter("job_type");
        String deadline = request.getParameter("deadline");
        String applyLink = request.getParameter("apply_link");

        // Assuming you have a database connection
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

        // Assuming you have a table named job_opportunities
        String sql = "INSERT INTO job_opportunities (job_title, company_name, location, job_description, job_type, deadline, apply_link,utype) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, jobTitle);
        ps.setString(2, companyName);
        ps.setString(3, location);
        ps.setString(4, jobDescription);
        ps.setString(5, jobType);
        ps.setString(6, deadline);
        ps.setString(7, applyLink);
        ps.setString(8, "admin");

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            %>
            <div class="alert alert-success" role="alert">
                Form submitted successfully!
            </div>
            <script>
                window.onload = function() {
                    alert('job Form submitted successfully!');
                };
            </script>
            <%
        } else {
            %>
           <div class="alert alert-danger" role="alert">
                Error submitting form. Please try again.
            </div>
           <script>
                window.onload = function() {
                    alert('job Form submitted unsuccessfully!');
                };
            </script>
            <%
        }

        con.close();
    } catch (Exception e) {
       %>
           <script>
                window.onload = function() {
                    alert('Form submitted unsuccessfully!<%=e %>');
                };
            </script> <%
    }
    %>
</div>

</body>
</html>
