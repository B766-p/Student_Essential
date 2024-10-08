<%@ page import="java.sql.*" %>
<%
    try {
        // Establishing database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

        // Getting the job ID to be deleted from the request parameter
        String jobId = request.getParameter("jobId");

        // Creating the SQL query to delete the job opportunity
        String sql = "DELETE FROM job_opportunities WHERE APPLY_LINK = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, jobId);

        // Executing the delete query
        int rowsAffected = ps.executeUpdate();

        // Closing resources
        ps.close();
        con.close();

        // Redirecting back to the view job opportunities page after deletion
        response.sendRedirect("intern1.jsp");
    } catch (Exception e) {
        // Handling any errors that occur during the deletion process
        out.println("<div>Error: " + e.getMessage() + "</div>");
    }
%>