<%-- 
    Document   : tech
    Created on : 04-Apr-2024, 01:32:56
    Author     : DELL
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Video Playlist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            margin-right: 10px;
        }
        select {
            padding: 5px;
            border-radius: 5px;
            margin-right: 10px;
        }
        button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Three columns with equal width */
            gap: 20px; /* Gap between cards */
        }
        .card {
            width: 80%; /* Set the width of the card */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card video {
            width: 100%; /* Set the width of the video */
            height: auto; /* Maintain aspect ratio */
            border-radius: 5px;
        }
        .card h3 {
            margin-top: 10px;
            font-size: 18px;
        }
        .card p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <form method="GET">
        <label for="type">Select course:</label>
        <select id="type" name="type">
            <option value="">All</option>
            <option value="computer_basics">Computer Basics</option>
            <option value="programming">Programming</option>
            <option value="c">C Programming</option>
            <option value="java">Java Programming</option>
            <option value="c++">C++ Programming</option>
            <option value="python">Python Programming</option>
            <option value="web_development">Web Development</option>
            <option value="database_management">Database Management</option>
            <option value="networking">Networking</option>
            <option value="cyber_security">Cyber Security</option>
            <option value="data_science">Data Science</option>
            <option value="artificial_intelligence">Artificial Intelligence</option>
            <option value="machine_learning">Machine Learning</option>
            <option value="cloud_computing">Cloud Computing</option>
        </select>
        <button type="submit">Filter</button>
    </form>

    <div class="card-container">
        <% 
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            String filterType = request.getParameter("type");

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");
                stmt = con.createStatement();
                String query = "SELECT * FROM v";
                if (filterType != null && !filterType.isEmpty()) {
                    query += " WHERE TYPE = '" + filterType + "'";
                }
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    String fileName = rs.getString("FILENAME");
                    String filePath = "v/" + fileName; // Update path as needed
                    String name = rs.getString("NAMES");
                    String type = rs.getString("TYPE");

        %>
                    <div class="card">
                        <video controls>
                            <source src="<%= filePath %>" type="video/mp4">
                            Your browser does not support HTML video.
                        </video>
                        <h3><%= name %></h3>
                        <p>Course: <%= type %></p>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        %>
    </div>
</body>
</html>
