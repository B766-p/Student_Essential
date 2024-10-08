<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

        String id = request.getParameter("id");
        String verify = request.getParameter("verify");

        String updateQuery = "UPDATE pdf SET VERIFY = ? WHERE ID = ?";
        pstmt = con.prepareStatement(updateQuery);
        pstmt.setString(1, verify);
        pstmt.setString(2, id);
        pstmt.executeUpdate();

        response.sendRedirect("pdf4.jsp"); // Redirect to your data display page after update
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>