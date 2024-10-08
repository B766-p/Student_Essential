<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;

    String id = request.getParameter("id");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

        String query = "DELETE FROM v WHERE ID = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, id);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<h2>Video deleted successfully</h2>");
            response.sendRedirect("video2.jsp");
        } else {
            out.println("<h2>Error deleting video</h2>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error deleting video</h2>");
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>