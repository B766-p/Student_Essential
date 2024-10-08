<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Display</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 50px;
        }
        .card {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 10px;
        }
        .card h2 {
            margin-top: 0;
            color: #333;
        }
        .card p {
            color: #555;
        }
        .pdf-viewer {
            width: 100%;
            height: 100px;
        }
        .card a {
            display: block;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            margin-top: 10px;
        }
        .card a:hover {
            background-color: #0056b3;
        }
        .pdf-image {
            max-width: 80%;
            height: auto;
            border-radius: 5px;
            display: inline-block; 
        }
        .pdf-image1 {
            max-width: 10%;
            height: auto;
            border-radius: 5px;
        }
           form {
        margin-bottom: 20px;
    }

    label {
        margin-right: 10px;
        font-weight: bold;
    }

    select {
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-right: 10px;
    }

    button {
        padding: 5px 10px;
        border-radius: 5px;
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }
    </style>
</head>
<body>
    <form method="GET">
    <label for="batch">Select Batch:</label>
    <select id="batch" name="batch">
        <option value="">All</option>
        <option value="1">1st year</option>
        <option value="2">2nd year</option>
        <option value="3">3rd year</option>
        <option value="4">4th year</option>
    </select>
    <label for="type">Select Type:</label>
    <select id="type" name="type">
        <option value="">All</option>
        <option value="question_papers">Question Papers</option>
        <option value="notes">Notes</option>
        <option value="syllabus">Syllabus</option>
        <option value="gateq">Gate Question Paper</option>
    </select>
    <button type="submit">Filter</button>
</form>
    <div class="card-container">
        <%@page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        <% Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");
            stmt = con.createStatement();

            String batch = request.getParameter("batch");
            String type = request.getParameter("type");

            String query = "SELECT * FROM pdf WHERE VERIFY = 'verify'";
            if (batch != null && !batch.isEmpty()) {
                query += " WHERE BATCH='" + batch + "'";
            }
            if (type != null && !type.isEmpty()) {
                if (query.contains("WHERE")) {
                    query += " AND TYPE='" + type + "'";
                } else {
                    query += " WHERE TYPE='" + type + "'";
                }
            }

            rs = stmt.executeQuery(query);

            while (rs.next()) {
        %>
            <div class="card">
                <img class="pdf-image" src="pdf.gif" alt="PDF Image">
                <h2><%= rs.getString("NAMES") %></h2>                       
                <p><strong>YEAR:</strong> <%= rs.getString("BATCH") %></p>
                <p><strong>TYPE:</strong> <%= rs.getString("TYPE") %></p>                  
                <p><strong>UPLOAD DATE:</strong> <%= rs.getString("UPLOAD_DATE") %></p>
                <div class="pdf-viewer">
                    <a href="pdf2.jsp?filename=<%= rs.getString("FILENAME") %>" target="_blank">
                        <img class="pdf-image1" src="pdf.webp" alt="PDF Image">View PDF
                    </a>
                </div>
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
