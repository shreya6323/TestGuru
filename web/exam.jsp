<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MCQ Exam</title>

   <script src='https://kit.fontawesome.com/fdf05f1614.js' crossorigin='anonymous'></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            /* Custom styles for black and green theme */
            body {
                background-color: #1F2937;
                color: #FFFFFF;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                line-height: 1.6;
            }
            h1, h2 {
                margin-bottom: 10px;
                color: #10B981;
            }
            form {
                margin-bottom: 20px;
            }
            .logo {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }
            .logo img {
                width: 40px;
                margin-right: 10px;
            }
        </style>
        <script type="text/javascript">
            // Set the total time for the exam (in seconds)
            var totalTime = 10; // 10 minutes in this example

            // Function to start the timer
            function startTimer() {
                var timer = setInterval(function () {
                    var minutes = Math.floor(totalTime / 60);
                    var seconds = totalTime % 60;
                    document.getElementById('timerText').innerHTML = minutes + 'm ' + seconds + 's';
                    if (totalTime <= 0) {
                        clearInterval(timerText);
                        // Handle time-up scenario (redirect, show message, etc.)
                        document.getElementById('timerText').innerHTML = 'Time\'s up!';
                        // Example: Redirect to submission page after time's up
                          document.getElementById('exam_complete').submit(); 
                       // window.location.href = 'submitExam';
                    }
                    else{
                    totalTime -= 1;
                }
                }, 1000);
            }

            // Call the function when the page loads
            window.onload = startTimer;
        </script>
        <style>
  .timer {
            display: flex;
           position:fixed;
            top: 25px; /* Adjust the top position */
            right: 25px; /* Adjust the right position */
            flex-direction: row;
            align-items: center;
            justify-content: center;
            border: 2px solid black;
            border-radius: 8px;
            padding: 10px;
        
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 150px;
            margin: 0 auto;
        }
        .timer-icon {
            font-size: 40px;
            color: #10B981;
        }
        .timer-text {
            font-size: 24px;
           
            margin-top: 10px;
            color: white;
            margin-left: 5px;
        }
        .custom-shadow {
    background-color: #2D3748; /* Dark gray background color */
    padding: 1.5rem; /* Adjust padding as needed */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 
        0 0 15px rgba(0, 0, 0, 0.3), /* Top */
        0 0 15px rgba(0, 0, 0, 0.3), /* Right */
        0 0 15px rgba(0, 0, 0, 0.3), /* Bottom */
        0 0 15px rgba(0, 0, 0, 0.3); /* Left */
}
 </style>
   <sql:setDataSource var="my_data" driver="org.postgresql.Driver"
                           url="jdbc:postgresql://localhost:5432/postgres" user="postgres" password="postgres"/>
   
            
            <sql:query dataSource="${my_data}" var="user">
                Select * from information_schema.quest_mstr where subject = ? 
               <sql:param value='<%= request.getSession().getAttribute("sub") %>' />
            </sql:query>
            
               
    </head>
    <body>
        <div class="container mx-auto px-4 py-8">
            <div class="logo">
                <img src='Images/logo.png' alt='site-logo' style='width: 70px; height: 70px;'>
                <h1 class="text-3xl ">MCQ Exam</h1>
            </div>
             <div class="timer">
            <i class="fas fa-stopwatch timer-icon"></i>
            <span class="timer-text" id="timerText"></span>
        </div>

            <form action="submitExam" method="post" class="space-y-6" id="exam_complete">
                <c:forEach var="x" items="${user.rows}">
                           <div class="bg-gray-800 p-4 rounded shadow custom-shadow">
                    <h2 class="text-2xl  mb-2">Question :${x.queid}</h2>
                    <p class="text-lg mb-2">${x.que}</p>
                    <label class="block mb-2 text-lg"><input type="radio" name="${x.queid}" value="${x.op1}" class="text-green-500">${x.op1}</label>
                    <label class="block mb-2 text-lg"><input type="radio" name="${x.queid}" value="${x.op2}" class="text-green-500">${x.op2}</label>
                    <label class="block mb-2 text-lg"><input type="radio" name="${x.queid}" value="${x.op3}"class="text-green-500"> ${x.op3}</label>
                    <label class="block mb-2 text-lg"><input type="radio" name="${x.queid}"value="${x.op4}" class="text-green-500">${x.op4}</label>
                </div>
                </c:forEach>
               

                <input type="submit" value="Submit" class="bg-green-500 text-white px-4 py-2 rounded shadow hover:bg-green-600 cursor-pointer">
            </form>
        </div>
    </body>
</html>
