<%-- 
    Document   : f1
    Created on : 02-Apr-2024, 14:21:42
    Author     : DELL
--%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.logging.Logger" %>

<%
Logger logger = Logger.getLogger("MyLogger");

// Directory where uploaded files will be saved
String uploadDir = "C:\\Users\\prita\\OneDrive\\Documents\\NetBeansProjects\\student esensial\\web\\pdf";

// Maximum size allowed for uploaded files (in bytes)
int maxFileSize = 10 * 1024 * 1024; // 10MB

try {
    MultipartRequest m = new MultipartRequest(request, uploadDir, maxFileSize);

    // Get the names of all uploaded files
    Enumeration files = m.getFileNames();
    while (files.hasMoreElements()) {
        String fileName = (String) files.nextElement();
        File file = m.getFile(fileName);
        if (file != null) {
             session.setAttribute("uploadedFileName", file.getName());
            // Process the uploaded file (e.g., save it to a database or display a success message)
            out.println("<p>File uploaded successfully: " + file.getName() + "</p>");
             
        }
    }
} catch (IOException e) {
    out.println("<p>Error uploading file: " + e.getMessage() + "</p>");
    logger.severe("Error uploading file: " + e.getMessage());
}
 response.sendRedirect("suup.jsp");%>