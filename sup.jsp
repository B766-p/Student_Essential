<%-- 
    Document   : sup
    Created on : 02-Apr-2024, 20:15:01
    Author     : DELL
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.UUID"%>
<%
    String year = (String) session.getAttribute("year");
    String batch = (String) session.getAttribute("batch");
    String type = (String) session.getAttribute("type");
    String filename = (String) session.getAttribute("uploadedFileName");
    String uid = (String) session.getAttribute("b");
        out.println("Year: " + year);
    out.println("Batch: " + batch);
    out.println("Type: " + type);
    out.println("Filename: " + filename);
    out.println("UID: " + uid);
    // Get the current date/time
    java.util.Date utilDate = new java.util.Date();
    java.sql.Date uploadDate = new java.sql.Date(utilDate.getTime());

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

        // Create SQL query
        String sql = "INSERT INTO v (id, NAMES, batch, type, filename, email, upload_date) VALUES (?, ?, ?, ?, ?, ?, ?)";

        // Create prepared statement
        PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        String uniqueCode = UUID.randomUUID().toString();

        // Set parameters
        stmt.setString(1, uniqueCode);
        stmt.setString(2, year); // Assuming NAMES should be set to year
        stmt.setString(3, batch);
        stmt.setString(4, type);
        stmt.setString(5, filename);
        stmt.setString(6, uid);
        stmt.setDate(7, uploadDate);

        // Execute the query
        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("Data inserted successfully.");
            response.sendRedirect("video.jsp");
        } else {
            out.println("Failed to insert data.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e);
    }
%>

