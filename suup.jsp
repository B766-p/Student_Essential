<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.UUID"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Date" %>

<%
    String year = (String) session.getAttribute("year");
    String batch = (String) session.getAttribute("batch");
    String type = (String) session.getAttribute("type");
    String filename = (String) session.getAttribute("uploadedFileName");
    String uid = (String) session.getAttribute("b");

    // Get the current date/time
    java.util.Date utilDate = new java.util.Date();
    java.sql.Date uploadDate = new java.sql.Date(utilDate.getTime());

    // JDBC driver name and database URL

    try {
        // Register JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

        // Create SQL query
 
        // Get UTYPE from userinfo1
        String utypeQuery = "SELECT * FROM userinfo1 WHERE EMAIL = ?";
        PreparedStatement utypeStmt = con.prepareStatement(utypeQuery);
        utypeStmt.setString(1, uid);
        ResultSet utypeResult = utypeStmt.executeQuery();

        // Check UTYPE and add VERIFY if allowed
        if (utypeResult.next()) {
            String utype = utypeResult.getString(1);
            String verifyStatus = "verify"; // Default verify status
            if ("parent".equals(utype)) {
                verifyStatus = "not verify"; // Change verify status for parent
            }

            // Create SQL query
            String sql = "INSERT INTO pdf (id, NAMES, batch, type, filename, email, upload_date, verify,utype) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            String uniqueCode = UUID.randomUUID().toString();

            // Set parameters
            stmt.setString(1, uniqueCode);
            stmt.setString(2, year);
            stmt.setString(3, batch);
            stmt.setString(4, type);
            stmt.setString(5, filename);
            stmt.setString(6, uid);
            stmt.setDate(7, uploadDate);
            stmt.setString(8, verifyStatus);
             stmt.setString(9, utype);

            // Execute the query
           int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("Data inserted successfully for verify.");
                response.sendRedirect("adds.jsp");
            } else {
                out.println("Failed to insert data for verify.");
            }
        } else {
            out.println("User not found.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e);
    }

    // Redirect to next page
    //response.sendRedirect("nextpage.jsp");
%>