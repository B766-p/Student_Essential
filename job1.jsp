<%-- 
    Document   : job1
    Created on : 01-Apr-2024, 12:00:27
    Author     : DELL
--%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Job Opportunities</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .section {
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 10px;
        }

        h2 {
            margin-top: 0;
        }

        p {
            margin-bottom: 8px;
        }

        form {
            margin-bottom: 20px;
        }

        .apply-button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .apply-button:hover {
            background-color: #0056b3;
        }
        /* Add this CSS to the existing styles */
form {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}

label {
    margin-right: 10px;
}

select {
    padding: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}

input[type="submit"] {
    padding: 5px 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 20px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

    </style>
</head>
<body>
<h1>View Job Opportunities</h1>
<form action="#" method="get">
    <label for="filter">Filter:</label>
    <select name="filter" id="filter">
        <option value="all">All</option>
        <option value="on_campus">On Campus</option>
        <option value="off_campus">Off Campus</option>
    </select>
    <input type="submit" value="Filter">
</form>
<%
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");
        String filter = request.getParameter("filter");
        String sql;
        if ("on_campus".equals(filter)) {
            sql = "SELECT * FROM job_opportunities WHERE job_type = 'on_campus'";
        } else if ("off_campus".equals(filter)) {
            sql = "SELECT * FROM job_opportunities WHERE job_type = 'off_campus'";
        } else {
//            sql = "SELECT * FROM job_opportunities WHERE job_type IN ('on_campus', 'off_campus')";
              sql = "SELECT * FROM job_opportunities WHERE job_type IN ('on_campus', 'off_campus')";
        }
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        while (rs.next()) {
            String jobTitle = rs.getString("job_title");
            String companyName = rs.getString("company_name");
            String location = rs.getString("location");
            String jobDescription = rs.getString("job_description");
            Date deadline = rs.getDate("deadline");
            String applyLink = rs.getString("apply_link");
%>
<div class="card">
    <h2><%= jobTitle %></h2>
    <p><strong>Company:</strong> <%= companyName %></p>
    <p><strong>Location:</strong> <%= location %></p>
    <p><strong>Description:</strong> <%= jobDescription %></p>
    <p><strong>Deadline:</strong> <%= dateFormat.format(deadline) %></p>
    <form action="<%= applyLink %>">
        <button type="submit" class="apply-button">Apply</button>
    </form>
    <form action="eaditj.jsp?action=edit" method="post">
        <input type="hidden" name="companyName" value="<%= companyName%>">
         <input type="hidden" name="applyLink" value="<%=applyLink%>">
        <button type="submit" class="apply-button">Edit</button>
    </form>
        <form action="deleteJob.jsp" method="post">
    <input type="hidden" name="jobId" value="<%= applyLink%>">
    <button type="submit" class="apply-button">Delete</button>
        </form>
</div>
<%
        }
        con.close();
    } catch (Exception e) {
        out.println("<div>Error: " + e.getMessage() + "</div>");
    }
%>
</body>
</html>
