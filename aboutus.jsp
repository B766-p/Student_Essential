<%-- 
    Document   : aboutus
    Created on : 30-Mar-2024, 16:21:29
    Author     : DELL
--%>
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
    background-color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
  }
  .navbar a {
    color: rgb(11, 11, 11);
    text-decoration: none;
    background-color: #f6efef;
    padding: 10px;
    border-radius: 10%;
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
  .sub-navbar {
    display: flex;
    justify-content: center;
    background-color:whitesmoke;
    margin-top: 20px;
    padding-inline: 20px;
  }
  .sub-navbar a {
    margin: 0 50px; /* Adjust spacing between links as needed */
    text-align: center;
    text-decoration: none;
    color: black;
    display: block;
  }
  .sub-navbar img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin: 0 50px; /* Adjust spacing between images as needed */
  }
  .sub-navbar span {
    display: block;
    margin-top: 5px;
    font-size: 20px; /* Adjust font size as needed */
    margin-bottom: 10px;
  }
  .header-section {
    position: relative;
    background-color: white;
    padding: 20px;
    text-align: left;
    height: 70vh;
    margin-top: 20px; /* Adjust margin-top as needed */
    display: flex;
    justify-content: space-between;
    align-items: flex-start; /* Align items at the top */
    overflow: hidden; /* Ensure the image is clipped */
  }
  .header-section img {
    position: absolute;
    top: 0;
    right: 0;
    width: 450px; /* Adjust image width as needed */
    height: auto;
    z-index: 1; /* Ensure this image is on top */
  }
  .header-section img.move {
    animation: moveLeft 5s linear infinite; /* Animation for moving left */
  }
  .header-section img:first-child {
    z-index: 0; /* Lower the z-index of the first image */
  }
  .header-section h1 {
    margin-top: 0; /* Remove default margin */
    font-size: 60px; /* Adjust font size as needed */
    font-weight: bold;
  }
  .header-section h3 {
    margin-top: 0; /* Remove default margin */
    font-size: 50px; /* Adjust font size as needed */
    font-weight: bold; /* Make the text bold */
  }
  .shop-now-btn {
    background-color: #0b0b0b; /* Button background color */
    color: white; /* Button text color */
    padding: 10px 20px; /* Button padding */
    border-radius: 20px; /* Button border radius for curved shape */
    border: none; /* Remove button border */
    cursor: pointer; /* Add pointer cursor on hover */
    margin-top: 20px; /* Adjust margin-top as needed */
    font-size: 18px; /* Button text size */
    transition: background-color 0.3s, color 0.3s; /* Smooth transition effect for hover */
  }
  .shop-now-btn:hover {
    background-color: #0a81ab; /* Change background color on hover */
    color: #fff; /* Change text color on hover */
  }
  /* Section styles */
.section {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
    
    margin-bottom: 20px;
}
.job-opportunities-section {
        background-color: #9c9898;
    }
    /* Learn New Skills Section */
    .learn-new-skills-section {
        background-color: whitesmoke;
    }
    /* Internship Section */
    .internship-section {
        background-color:#9c9898;
    }
    /* Syllabus Section */
    .syllabus-section {
        background-color: #f5f5f5;
    }

/* Card container styles */
.card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 150px;
    margin-top: 20px;
}

/* Card styles */
.card {
    width: 250px;
    padding: 20px;
    background-color: whitesmoke;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.card img {
    width: 110px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 10px;
}

.card h3 {
    margin-top: 0;
    margin-bottom: 10px;
}

.card p {
    color: #555;
    margin-bottom: 15px;
}

/* Button styles */
.btn {
    background-color: #0b0b0b;
    color: white;
    padding: 10px 20px;
    border-radius: 20px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.btn:hover {
    background-color: #0a81ab;
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
.about-us-content {
    display: flex;
    align-items: center;
}

.image-container {
    flex: 0 0 auto; /* Prevent image from growing */
    margin-right: 20px; /* Adjust spacing between image and text */
    height: 650px;
    width: 650px;
    position: relative; /* Set position to relative */
}

.image-container img {
    position: absolute; /* Set position to absolute */
    left: 0; /* Align the image to the left */
    top: 0; /* Align the image to the top */
    height: 100%; /* Set the height to 100% of the container */
    width: 100%; /* Set the width to 100% of the container */
    object-fit: cover; /* Maintain aspect ratio and cover the container */
}
.text-container {
    flex: 1;
    font-size: 28px; /* Set the font size to 20 pixels */
    line-height: 1.5;  /* Allow text to grow and take up remaining space */
}





  @keyframes moveLeft {
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
    <div class="navbar">
      <div class="logo">
        <img src="k.gif" alt="Logo">
        <span><b>Student Essential</b></span>
      </div>
      <div>
        <a href="index.html">Home</a>
        <a href="#contact" style="background-color: black; color: white; border-radius: 0;">About Us</a>
        <a href="login.jsp" >LOGIN/SINGUP</a>
      </div>
    </div>
    <div class="sub-navbar">
      <a href="#link1">
        <img src="1.svg" alt="Image 1">
        <span><b>job opportunities</b></span>
      </a>
      <a href="#link2">
        <img src="2.svg" alt="Image 2">
        <span><b>learn your technical skills</b></span>
      </a>
      <a href="#link3">
        <img src="3.svg" alt="Image 3">
        <span><b>internship</b></span>
      </a>
      <a href="#link4">
        <img src="4.svg" alt="Image 4">
        <span><b>syllabus</b></span>
      </a>
    </div>
    <div class="header-section">
      <div>
        <h1>Welcome to Student Essential</h1><br><br>
        <h3>Your one-stop solution for <br>all of your educational needs and <br><span id="typewriter"></span></h3>
        <button class="shop-now-btn">Know more </button> <!-- Added Shop Now button -->
      </div>
      <img src="h1.webp" alt="Image on the right">
     
    </div>
    
      <!-- Existing code -->

    <!-- About Us Section -->
    <div class="section">
        <div class="about-us-content">
            <div class="image-container">
                <img src="about.webp" alt="Image">
            </div>
            <div class="text-container">
                <h1><b>About Us</b></h1>
                <p>At Student Essential, we understand the unique challenges that students face in their educational journey. From managing coursework to exploring career opportunities, students need reliable resources and support to succeed.</p>
                <p>Our platform is designed to be a one-stop solution for all of your educational needs. Whether you're looking for job opportunities, want to enhance your technical skills, or seek valuable internships, we've got you covered.</p>
                <p>We believe that education should be accessible to all, which is why we offer a wide range of courses and resources to help you learn and grow. Join us in your quest for knowledge and skill development, and let's build a brighter future together!</p>
            </div>
        </div>
    </div>
    

    <!-- Footer -->
<footer>
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
  </div>

  <script>
    // Simulate page load
    setTimeout(() => {
      document.getElementById('preloader').style.opacity = '0';
      document.getElementById('preloader').style.pointerEvents = 'none';
      document.getElementById('content').style.display = 'block';
    }, 3000); // Adjust the time (in milliseconds) as needed
  </script>
</body>
</html>
