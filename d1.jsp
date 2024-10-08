<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    if (id != null && !id.isEmpty()) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

            String query = "DELETE FROM pdf WHERE ID = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, id);
            stmt.executeUpdate();

            response.sendRedirect("pdf3.jsp"); // Redirect to the view page after deletion
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred: " + e);
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    } else {
        out.println("ID parameter is missing.");
    }
%>