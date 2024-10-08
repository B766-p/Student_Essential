<%-- 
    Document   : p1
    Created on : 31-Mar-2024, 18:25:23
    Author     : DELL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
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
    .container {
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
        }
        form {
            width: 300px;
            float: left;
        }
        .profile-card {
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            float: left;
        }
        .profile-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .profile-card button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .card {
            width: 600px;
            height: 450px;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="submit"] {
            width: 480px;
            padding: 10px;
            margin-top: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .error {
            color: red;
        }
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
    .card-container {
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
    margin-top: 20px;
    margin-bottom: 30px;
}

.card1 {
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 10px;
    text-align: center;
    transition: transform 0.3s;
}

.card1 img {
    width: 100%;
    border-radius: 8px;
}

.card-button {
    background-color: #4CAF50;
    color: white;
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

.card-button:hover {
    background-color: #45a049;
}

.card1:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
footer {
  background-color: #333;
  color: #fff;
  padding: 20px 0;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.footer-left,
.footer-right {
  flex: 1;
}

.footer-left h3,
.footer-right h3 {
  margin-bottom: 10px;
  color: #fff;
}

.footer-left p {
  margin-bottom: 10px;
}

.footer-right form input,
.footer-right form textarea,
.footer-right form button {
  width: 100%;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  border: none;
}

.footer-right form button {
  background-color: #0b0b0b;
  color: #fff;
  cursor: pointer;
}

.footer-right form button:hover {
  background-color: #0a81ab;
}

.footer-bottom {
  text-align: center;
  margin-top: 20px;
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




</style>
</head>
<body>
  <!-- Preloader -->

      <h1>Profile</h1>
    <div class="container">
        <div class="profile-card">
            <h2>Profile Details</h2>
            <%
                // Connect to the database
                String uid = (String) session.getAttribute("b");

                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tutor","tutor123"); 
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM USERINFO1 WHERE email = ?");
                    // Assuming you have a user id available
                    ps.setString(1, uid);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        String name = rs.getString(2);
                        String email = rs.getString("email");
                        String utype = rs.getString(1);
                        String mobile = rs.getString(4);
                        String pass = rs.getString(3);
                         String scode = rs.getString(6);
            %>
                        <img src="AD.webp" alt="Profile Image">
                        <p><strong>Name:</strong> <%= name %></p>
                        <p><strong>User:</strong><%= utype %></p>
   <%
    String firstName = request.getParameter("first_name");
    String emailAddress = request.getParameter("email_address");
    String mmobile = request.getParameter("m");
    String sccode = request.getParameter("s");
    String newPassword = request.getParameter("new_password");

    // Validate form data (add more validation as needed)
    if (firstName != null && emailAddress != null && mobile != null && scode != null && newPassword != null) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tutor", "tutor123"); 
            String sql = "UPDATE userinfo1 SET UNAME=?, UPASS=?, MOBILE=?, EMAIL=?, SCODE=? WHERE EMAIL=?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, firstName); // Assuming UNAME is the first name
                statement.setString(2, newPassword);
                statement.setString(3, mmobile);
                statement.setString(4, emailAddress);
                statement.setString(5, sccode);
                statement.setString(6, emailAddress); // Use email as the identifier

                // Execute the update query
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
%>
                    <div class="alert alert-success">
                        Profile updated successfully!
                    </div>
<%
                } else {
%>
                    <div class="alert alert-fail">
                        Failed to update profile. Please try again.
                    </div>
<%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='alert alert-fail'>Database error occurred. Please try again later.</div>");
        }
    } else {
%>
        <div class="alert alert-success">
            update notification
        </div>
<%
    }
%>
           
            <button id="change-profile-btn">Change Profile Picture</button>
        </div>
        <div class="card">
            <h2>Update Details</h2>
            <form name="profileForm" action="#" method="post" onsubmit="return validateForm()">
                <label for="first_name">First Name:</label>
                <input type="text" id="first_name" name="first_name" value="<%= name %>" required>

                <label for="email_address">Email Address:</label>
                <input type="email" id="email_address" name="email_address" value="<%= email %>" required>

                <label for="current_password">Mobile :</label>
                <input type="text" id="current_password" name="m" value="<%= mobile %>">
                 <label for="current_password">Scode :</label>
                <input type="text" id="current_password" name="s" value="<%= scode %>">

                <label for="new_password">PASSWORD</label>
                <input type="password" id="new_password" name="new_password" value="<%= pass %>" >

                <input type="submit" value="Save">
            </form>
        </div>
    </div>
    <div class="clearfix"></div>
  
 
 
     <%
                    }
                   
                } catch (Exception e) {
                    out.println("<p class=\"error\">An error occurred: " + e.getMessage() + "</p>");
                }
            %>
  <!-- JavaScript to hide preloader after delay -->

</body>
</html>

