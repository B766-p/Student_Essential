<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
    height: 80vh;
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
        <a href="#news">Home</a>
        <a href="aboutus.jsp">About Us</a>
<!--        <a href="teachers.jsp">Teacher singup</a>-->
        <a href="login.jsp" style="background-color: black; color: white; border-radius: 0;">LOGIN/SINGUP</a>
      </div>
    </div>
    <div class="sub-navbar">
      <a href="login.jsp">
        <img src="1.svg" alt="Image 1">
        <span><b>Job opportunities</b></span>
      </a>
      <a href="login.jsp">
        <img src="2.svg" alt="Image 2">
        <span><b>Learn your technical skills</b></span>
      </a>
      <a href="login.jsp">
        <img src="3.svg" alt="Image 3">
        <span><b>Internship</b></span>
      </a>
      <a href="login.jsp">
        <img src="4.svg" alt="Image 4">
        <span><b>Syllabus</b></span>
      </a>
    </div>
    <div class="header-section">
      <div>
        <h1>Welcome to Student Essential</h1><br><br>
        <h3>Your one-stop sollution for <br>all of your educational needs and <br><span id="typewriter"></span></h3>
        <button class="shop-now-btn">Know more </button> <!-- Added Shop Now button -->
      </div>
      <img src="h1.webp" alt="Image on the right">
     
    </div>
    
      <!-- Existing code -->
    
      <div class="section">
        <h2>Job Opportunities</h2>
        <div class="card-container">
            <div class="card">
                <img src="j1.webp" alt="Job 1">
                <h3>Web Developer</h3>
                <p>After you login you can</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Apply Now</a></button>
            </div>
            <div class="card">
                <img src="j2.webp" alt="Job 2">
                <h3>Front-end Developer</h3>
                <p> After you login you can</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Apply Now</a></button>
            </div>
            <div class="card">
                <img src="j3.webp" alt="Job 3">
                <h3>Back-end Developer</h3>
                <p>After you login you can</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Apply Now</a></button>
            </div>
        </div>
    </div>
    <!-- Learn New Skills Section -->
    <div class="section">
        <h2>Learn New Skills</h2>
        <div class="card-container">
            <div class="card">
                <img src="c.webp" alt="Skill 1">
                <h3>c</h3>
                <p>login to enroll in the cources</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Enroll Now</a></button>
            </div>
            <div class="card">
                <img src="java.webp" alt="Skill 2">
                <h3>java</h3>
                <p>login to enroll in the cources</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Enroll Now</a></button>
            </div>
            <div class="card">
                <img src="act.webp" alt="Skill 3">
                <h3>Auto card</h3>
                <p>login to enroll in the cources</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Enroll Now</a></button>
            </div>
        </div>
    </div>
    <!-- Internship Section -->
    <div class="section">
        <h2>Internship</h2>
        <div class="card-container">
            <div class="card">
                <img src="ip1.webp" alt="Internship 1">
                <h3>Marketing Intern</h3>
                <p>login to know more </p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Apply Now</a></button>
            </div>
            <div class="card">
                <img src="ip.webp" alt="Internship 2">
                <h3>Software Development Intern</h3>
                <p>login to know more </p>
               <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Apply Now</a></button>
            </div>
            <div class="card">
                <img src="ip2.webp" alt="Internship 3">
                <h3>Graphic Design Intern</h3>
                <p>login to know more</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">Apply Now</a></button>
            </div>
        </div>
    </div>
    <!-- Syllabus Section -->
    <div class="section">
        <h2>Syllabus</h2>
        <div class="card-container">
            <div class="card">
                <img src="pws2.webp" alt="Syllabus 1">
                <h3>Mathematics I</h3>
                <p>Subject Description</p>
               <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">View Details</a></button>
            </div>
            <div class="card">
                <img src="pws1.svg" alt="Syllabus 2">
                <h3>Thermodynamics</h3>
                <p>Subject Description</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">View Details</a></button>
            </div>
            <div class="card">
                <img src="pws.svg" alt="Syllabus 3">
                <h3>Power Systems</h3>
                <p>Subject Description</p>
                <button class="btn"> <a href="login.jsp" style="text-decoration:none;color:white">View Details</a></button>
            </div>
        </div>
    </div>

    
   
  </div>
  <!-- Footer -->
<footer>
  <div class="footer-content">
    <!-- Logo -->
    <div class="l">
      <img src="k.gif" alt="Logo">
    </div>
    <!-- Contact Information -->
    <div class="contact-info">
      <h4>Contact Us</h4>
      <p>Email: thestudentessential@gmail.com</p>
      <p>Phone: +91 6370708181</p>
    </div>
    <!-- Form -->
    <div class="footer-form">
      <h4>Subscribe to Our Newsletter</h4>
      <form action="#" method="POST">
        <input type="email" name="email" placeholder="Enter your email" required>
        <button type="submit">Subscribe</button>
      </form>
    </div>
  </div>
</footer>
  <footer>
    <div class="copyright">
        <p>&copy; 2024 Student_Essential.com All rights reserved.</p>
    </div>
</footer>



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

    const texts = ["Academic necessities", "Academic necessities", "Educational essentials", "Learning requirements"];
    let textIndex = 0;
    let charIndex = 0;
    let isDeleting = false;

    function typeWriter() {
      const currentText = texts[textIndex];
      if (!isDeleting) {
        document.getElementById("typewriter").textContent += currentText[charIndex];
        charIndex++;
        if (charIndex === currentText.length) {
          isDeleting = true;
          setTimeout(() => {
            charIndex = 0;
            document.getElementById("typewriter").textContent = "";
            textIndex++;
            if (textIndex === texts.length) {
              textIndex = 0;
            }
            setTimeout(typeWriter, 500); // Delay before starting to delete
            isDeleting = false;
          }, 2000); // Time to display the complete word
        } else {
          setTimeout(typeWriter, 100); // Typing speed
        }
      } else {
        document.getElementById("typewriter").textContent = currentText.substring(0, charIndex);
        charIndex--;
        if (charIndex === 0) {
          isDeleting = false;
        }
        setTimeout(typeWriter, 100); // Deleting speed
      }
    }
    typeWriter(); // Initial call to start the typewriter effect
  </script>
</body>
</html>

