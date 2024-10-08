<%-- 
    Document   : viewuser
    Created on : 31-Mar-2024, 18:59:50
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Information</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }

    .container {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .user-section {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }

    .card {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 300px;
      box-sizing: border-box;
    }

    .admin {
      background-color: #e74c3c;
      color: #fff;
    }

    .teacher {
      background-color: #2ecc71;
      color: #fff;
    }

    .parents {
      background-color: #3498db;
      color: #fff;
    }

    .card p {
      margin: 8px 0;
    }
  </style>
</head>
<body>

<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123");

    // Count of Admins
    String adminType = "admin";
    PreparedStatement adminCountPs = con.prepareStatement("SELECT COUNT(*) FROM userinfo1 WHERE utype = ?");
    adminCountPs.setString(1, adminType);
    ResultSet adminCountRs = adminCountPs.executeQuery();
    int adminCount = 0;
    if (adminCountRs.next()) {
        adminCount = adminCountRs.getInt(1);
    }
    String teacherType = "TEACHER";
    PreparedStatement teacherCountPs = con.prepareStatement("SELECT COUNT(*) FROM userinfo1 WHERE utype = ?");
    teacherCountPs.setString(1, teacherType);
    ResultSet teacherCountRs = teacherCountPs.executeQuery();
    int teacherCount = 0;
    if (teacherCountRs.next()) {
        teacherCount = teacherCountRs.getInt(1);
    }
    String parentType = "parent";
    PreparedStatement parentCountPs = con.prepareStatement("SELECT COUNT(*) FROM userinfo1 WHERE utype = ?");
    parentCountPs.setString(1, parentType);
    ResultSet parentCountRs = parentCountPs.executeQuery();
    int parentCount = 0;
    if (parentCountRs.next()) {
        parentCount = parentCountRs.getInt(1);
    }
%>
<div class="user-section">
<div class="container">
  <div class="card admin">
    <img src="AD.webp" alt="Admin" style="width: 100%; height: auto;">
    <p><strong>Admins Count:</strong> <%= adminCount %></p>
  </div>
</div>
  <div class="container">
  <div class="card teacher">
    <img src="teacher.webp" alt="Teacher" style="width: 100%; height: auto;">
    <p><strong>Teachers Count:</strong> <%= teacherCount %></p>
  </div>
</div>
  <div class="container">
  <div class="card parents">
    <img src="student.webp" alt="Parent" style="width: 100%; height: auto;">
    <p><strong>Students Count:</strong> <%= parentCount %></p>
  </div>
</div>
</div>

<h2>Admin</h2>
<hr style="border:none; height: 5px; background-color: red; margin: 20px 0">

<div class="user-section">
<%
    // Display Admins
    String aType = "admin";
    PreparedStatement adminPs = con.prepareStatement("SELECT * FROM userinfo1 WHERE utype = ?");
    adminPs.setString(1, aType);
    ResultSet adminRs = adminPs.executeQuery();
    while (adminRs.next()) {
        String utype = adminRs.getString(1);
        String uname = adminRs.getString(2);
        String m = adminRs.getString(4);
        String em = adminRs.getString(5);
        String sc = adminRs.getString(6);
%>

    <div class="card admin">
        <img src="AD.webp" alt="Admin" style="width: 50%; height: auto;">
        <p> <%= utype %></p>
        <p><strong> Name:</strong> <%= uname %></p>
        <p><strong>Email:</strong> <%= em %></p>
        <p><strong>mobile:</strong> <%= m %></p>
        <p><strong>security code:</strong> <%= sc %></p>
    </div>
<%
    }
%>
</div>





<h2>Teacher</h2>
<hr style="border:none; height: 5px; background-color: greenyellow; margin: 20px 0;">

<div class="user-section">
<%
    // Display Teachers

    PreparedStatement teacherPs = con.prepareStatement("SELECT * FROM userinfo1 WHERE utype = ?");
    teacherPs.setString(1, teacherType);
    ResultSet teacherRs = teacherPs.executeQuery();
    while (teacherRs.next()) {
        String utype = teacherRs.getString(1);
        String uname = teacherRs.getString(2);
        String m = teacherRs.getString(4);
        String em = teacherRs.getString(5);
        String sc = teacherRs.getString(6);
%>

    <div class="card teacher">
        <img src="teacher.webp" alt="Admin" style="width: 50%; height: auto;">
        <p> <%= utype %></p>
        <p><strong> Name:</strong> <%= uname %></p>
        <p><strong>Email:</strong> <%= em %></p>
        <p><strong>mobile:</strong> <%= m %></p>
        <p><strong>security code:</strong> <%= sc %></p>
    </div>
<%
    }
%>
</div>




<h2>Parents</h2>
<hr style="border:none; height: 5px; background-color: blueviolet; margin: 20px 0;">

<div class="user-section">
<%
    // Display Parents
  
    PreparedStatement parentPs = con.prepareStatement("SELECT * FROM userinfo1 WHERE utype = ?");
    parentPs.setString(1, parentType);
    ResultSet parentRs = parentPs.executeQuery();
    while (parentRs.next()) {
        String utype = parentRs.getString(1);
        String uname = parentRs.getString(2);
        String m = parentRs.getString(4);
        String em = parentRs.getString(5);
        String sc = parentRs.getString(6);
%>

    <div class="card parents">
        <img src="student.webp" alt="Admin" style="width: 50%; height: auto;">
        <p>Student</p>
        <p><strong> Name:</strong> <%= uname %></p>
        <p><strong>Email:</strong> <%= em %></p>
        <p><strong>mobile:</strong> <%= m %></p>
        <p><strong>security code:</strong> <%= sc %></p>
    </div>
<%
    }

    con.close();
} catch (Exception e) {
    out.println(e);
}
%>

</body>
</html>

