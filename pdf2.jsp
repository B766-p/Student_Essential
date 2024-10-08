<%-- 
    Document   : pdf2
    Created on : 03-Apr-2024, 23:40:17
    Author     : DELL
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PDF Viewer</title>
     <script>
        function goBack() {
            window.history.back();
        }
    </script>
</head>
<body>
    <%
        String filename = request.getParameter("filename");
    %>
  
    <embed src="pdf/<%= filename %>" type="application/pdf" width="100%" height="600px">
</body>
</html>
