<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
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
            height: 300px; /* Adjust height as needed */
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
        .delete-button {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .verify-form {
    margin-top: 10px;
    display: flex;
    align-items: center;
}

.verify-form select {
    padding: 5px;
    border-radius: 5px;
    margin-right: 10px;
}

.verify-form button {
    background-color: #28a745;
    color: #fff;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
}

    </style>
</head>
<body>
    <div class="card-container">
        <% Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");
            stmt = con.createStatement();

            String batch = request.getParameter("batch");
            String type = request.getParameter("type");
          
           String query = "SELECT * FROM pdf WHERE VERIFY != 'verify'"; // Modify the query here
            if (batch != null && !batch.isEmpty()) {
                query += " AND BATCH='" + batch + "'";
            }
            if (type != null && !type.isEmpty()) {
                query += " AND TYPE='" + type + "'";
            }


            rs = stmt.executeQuery(query);

            while (rs.next()) {
        %>
            <div class="card">
                <div class="pdf-viewer">
                    <embed src="pdf/<%= rs.getString("FILENAME") %>" width="100%" height="100%">
                </div>
                <h2><%= rs.getString("NAMES") %></h2>
                <p><strong>YEAR:</strong> <%= rs.getString("BATCH") %></p>
                <p><strong>TYPE:</strong> <%= rs.getString("TYPE") %></p>
                <p><strong>UPLOAD DATE:</strong> <%= rs.getString("UPLOAD_DATE") %></p>
               
                <form action="d1.jsp" method="post">
                    <input type="hidden" name="id" value="<%= rs.getString("ID") %>">
                    <button type="submit" class="delete-button">Delete</button>
                </form>
                <form action="verify.jsp" method="post" class="verify-form">
                    <input type="hidden" name="id" value="<%= rs.getString("ID") %>">
                    <select name="verify">
                        <option value="verify">Verify</option>
                        <option value="unverify">Unverify</option>
                    </select>
                    <button type="submit">Update</button>
                </form>
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