<%-- 
    Document   : eaditj
    Created on : 01-Apr-2024, 18:27:39
    Author     : DELL
--%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date, java.time.LocalDate" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit/Update Job Opportunity</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], textarea, input[type="date"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Edit/Update Job Opportunity</h1>
<%
String action = request.getParameter("action");
if ("edit".equals(action)) {
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");
        String companyName = request.getParameter("companyName");
        String applyLink = request.getParameter("applyLink");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM job_opportunities WHERE company_name = ? AND apply_link = ?");
        ps.setString(1, companyName);
        ps.setString(2, applyLink);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String jobTitle = rs.getString("job_title");
            String location = rs.getString("location");
            String jobDescription = rs.getString("job_description");
            Date deadline = rs.getDate("deadline");
%>
<form id="updateForm" action="eaditj.jsp?action=update" method="post">
    <div class="card">
        <input type="hidden" name="companyName" value="<%= companyName %>">
        <label for="jobTitle">Job Title:</label>
        <input type="text" name="jobTitle" value="<%= jobTitle %>">
        <label for="location">Location:</label>
        <input type="text" name="location" value="<%= location %>">
        <label for="jobDescription">Job Description:</label>
        <textarea name="jobDescription"><%= jobDescription %></textarea>
        <label for="deadline">Deadline:</label>
        <input type="date" name="deadline" value="<%= deadline%>">
        <label for="applyLink">Apply Link:</label>
        <input type="text" name="applyLink" value="<%= applyLink %>">
    </div>
    <input type="submit" value="Save Changes">
</form>

<%
        } else {
            out.println("Job opportunity not found.");
        }
        con.close();
    } catch (Exception e) {
        out.println("<div>Error: " + e.getMessage() + "</div>");
    }
} else if ("update".equals(action)) {
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");
        String companyName = request.getParameter("companyName");
        String applyLink = request.getParameter("applyLink");
        String jobTitle = request.getParameter("jobTitle");
        String location = request.getParameter("location");
        String jobDescription = request.getParameter("jobDescription");
          String deadline = request.getParameter("deadline");

        PreparedStatement ps = con.prepareStatement("UPDATE job_opportunities SET job_title = ?, location = ?, job_description = ?, deadline = ? WHERE company_name = ? AND apply_link = ?");
        ps.setString(1, jobTitle);
        ps.setString(2, location);
        ps.setString(3, jobDescription);
        ps.setString(4, deadline);
        ps.setString(5, companyName);
        ps.setString(6, applyLink);
        int rowsAffected = ps.executeUpdate();
        con.close();

        if (rowsAffected > 0) {
%>
<script>
    alert("Job opportunity updated successfully.");
   
        window.location.href = "job1.jsp";
   // 3 seconds
</script>
<%
        } else {
%>
<script>
    alert("Failed to update job opportunity.");
    window.history.back();
</script>
<%
        }
    } catch (Exception e) {
%>
<script>
    alert("Error: <%= e.getMessage() %>");
    window.history.back();
</script>
<%
    }
} else {
%>
<script>
    alert("Invalid action.");
    window.history.back();
</script>
<%
}
%>
</body>
</html>


