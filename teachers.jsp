<%-- 
    Document   : teachers
    Created on : 31-Mar-2024, 18:13:35
    Author     : DELL
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Page Preloader</title>
<style>
  /* Preloader styles */
  .preloader {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background-color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    opacity: 1;
    transition: opacity 0.5s ease-in-out;
  }
  .preloader img {
    width: 350px; /* Adjust size as needed */
    height: 300px; /* Adjust size as needed */
  }
  .navbar {
    overflow: hidden;
    background-color: #f8f4f4;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
  }
  .navbar a {
    color: rgb(11, 11, 11);
    text-decoration: none;
    padding: 10px;
    border-radius: 50%;
  }
  .navbar a:hover {
    background-color: #0b0b0b;
    color: rgb(238, 231, 231);
    border-radius: 10%;
  }
  .navbar img {
    height: 50px;
  }
  .navbar .logo {
    display: flex;
    align-items: center;
  }
  .navbar .logo span {
    font-size: 24px; /* Adjust font size as needed */
    margin-left: 10px;
  }
/* Header section styles */
.header-section {
  position: relative;
  background-color: whitesmoke;
  padding: 20px;
  text-align: left;
  height: 150vh;
  margin-top: 20px;
  margin-bottom: 10px;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  overflow: hidden;
}

.header-section img {
  position: absolute;
  top: 0;
  right: 0;
  width: 450px;
  height: auto;
  z-index: 1;
}

.header-section img.move {
  animation: moveLeft 5s linear infinite;
}

.header-section img:first-child {
  z-index: 0;
}

.header-section .form-card {
  width: 300px;
  padding: 20px;
  margin: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out;
}

.header-section .form-card:hover {
  transform: scale(1.05);
}

.header-section form {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.header-section label {
  margin-bottom: 2px;
}
.header-section input[type="text"],
.header-section input[type="email"],
.header-section input[type="password"],
.header-section input[type="submit"] {
  padding: 8px;
 
  width: 100%;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.header-section input[type="submit"] 
                {
  background-color: #0b0b0b;
  color: white;
  cursor: pointer;
  border: none;
}

.header-section input[type="submit"]:hover 
{
  background-color: #0a81ab;
}
.form-card button {
    background-color: #0b0b0b;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

.form-card button:hover {
    background-color: #0a81ab;
}

.forgot-password {
    color: #0b0b0b;
    text-decoration: none;
}

.forgot-password:hover {
    text-decoration: underline;
}
/* Footer styles */
footer {
  background-color: #0b0b0b;
  color: white;
  padding: 20px 0;
  text-align: center;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.l img {
  height: 250px;
}

.contact-info {
  text-align: left;
}

.footer-form {
  text-align: right;
  margin-right: 30px;
}

.footer-form input {
  padding: 10px;
  margin-right: 10px;
  border-radius: 5px;
  border: none;
}

.footer-form button {
  padding: 10px 20px;
  background-color: #fff;
  color: #0b0b0b;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.footer-form button:hover {
  background-color: #0a81ab;
  color: white;
}
.alert {
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
}

.alert-fail {
  color: #721c24;
  background-color: #f8d7da;
  border-color: #f5c6cb;
}

.alert-success {
  color: #155724;
  background-color: #d4edda;
  border-color: #c3e6cb;
}

  @keyframes moveLeft 
  {
    0% {
      transform: translateX(0%);
    }
    100% {
      transform: translateX(-100%);
    }
  }
</style>
</head>
<body>
  <!-- Preloader -->
  <div class="preloader" id="preloader">
    <img src="k.gif" alt="Loading..."><br><br>
  </div>

  <!-- Page content -->
  <div id="content" style="display: none;">
<!--    <div class="navbar">
        <div class="logo">
          <img src="k.gif" alt="Logo">
          <span><b>Student Essential</b></span>
        </div>
        <div>
          <a href="#news">Home</a>
          <a href="aboutus.jsp">About Us</a>
          <a href="teachers.jsp">Teacher sign-up</a>
          <a href="login.jsp" style="background-color: black; color: white; border-radius: 0;">Login/Signup</a>
        </div>
      </div>-->
   
      <div class="header-section">
        <img src="h1.webp" alt="Image on the right">
      
        <div class="form-card">
            <%
    String uname = request.getParameter("uname");
    String upass = request.getParameter("upass");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String scode = request.getParameter("scode");

    // Validate form data (add more validation as needed)
    if (uname != null && upass != null && mobile != null && email != null && scode != null) {
        // Database connection parameters (replace with your actual database details)
        

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tutor","tutor123"); 
            // Prepare SQL statement
            String sql = "INSERT INTO userinfo1 (utype,UNAME, UPASS, MOBILE, EMAIL, SCODE) VALUES (?,?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, "TEACHER");
                statement.setString(2, uname);
                statement.setString(3, upass);
                statement.setString(4, mobile);
                statement.setString(5, email);
                statement.setString(6, scode);

                // Execute the statement
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
%>
                    <div class="alert alert-success">
                        Registration successful!
                    </div>
                    <script>
                    alert("successfully register!");
                   </script>
<!--                   <script>
                    setTimeout(function() {
        
                     window.location.href = 'login.jsp'; 
                     }, 5000); 
                   </script>-->
<%
                } else {
%>
                    <div class="alert alert-fail">
                        Registration failed. Please try again.
                    </div>
                    <script>
                    alert("unsuccessfully register!");
                   </script>
<%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
         out.println(e);
          %>
 <div class="alert alert-fail">
                        Registration unsuccessful!
                    </div>
                    <script> alert("unsuccessfully register!");
                   </script>
                   <% 
        }
    } else {
%>
        <div class="alert alert-success">
                Please fill in all the fields.
        </div>
<%
    }
%>
            <h1>TEACHER SIGN-UP</h1>
            <form action="#" method="POST">
                <label for="uname">Username:</label><br>
                <input type="text" id="uname" name="uname"><br>
                <label for="upass">Password:</label><br>
                <input type="password" id="upass" name="upass"><br>
                <label for="mobile">Mobile:</label><br>
                <input type="text" id="mobile" name="mobile"><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email"><br>
                <label for="scode">what is your security code if you forgot password:</label><br>
                <input type="text" id="scode" name="scode"><br><br>
                <input type="submit" value="SIGN UP">
            </form>
<!--            <button onclick="window.location.href='login.jsp'">If you have an account, login Here</button>-->
        </div>
        
    </div>
   
<!--    <footer>
        <div class="footer-content">
          <div class="l">
            <img src="k.gif" alt="Logo">
          </div>
          <div class="contact-info">
            <p><b>Contact Us</b></p>
            <p>123 Street Name</p>
            <p>City, Country</p>
            <p>Email: info@example.com</p>
            <p>Phone: +123-456-7890</p>
          </div>
          <div class="footer-form">
            <p><b>Subscribe to our newsletter</b></p>
            <input type="email" placeholder="Enter your email">
            <button>Subscribe</button>
          </div>
        </div>
      </footer>
    -->
        
    </div>

  <!-- JavaScript to hide preloader after delay -->
  <script>
    setTimeout(function() {
      const preloader = document.getElementById('preloader');
      const content = document.getElementById('content');
      preloader.style.opacity = 0;
      setTimeout(() => {
        preloader.style.display = 'none';
        content.style.display = 'block';
      }, 500); // Adjust the fade-out delay as needed
    }, 3000); // Adjust the delay before preloader fades out as needed (in milliseconds)

  
  </script>
</body>
</html>
