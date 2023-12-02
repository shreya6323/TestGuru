<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@400;700&display=swap">
        <title>Exam Result</title>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 20px;
                background-color: #f9f9f9;
            }
            .top {
                display: flex;
                align-items: center;
                flex-direction: row;
                justify-content: center;
            }
            h1 {
                text-align: center;
                margin-bottom: 30px;
                color: #2ecc71;
                font-family: 'Comfortaa', serif;
                font-size: 36px;
            }
            .result {
                border-radius: 8px;
                padding: 30px;
                padding-top:10px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 600px;
                margin: 0 auto;
            }
            .result-heading {
                font-size: 28px;
                font-weight: bold;
                margin-bottom: 15px;
                color: #007bff;
            }
            .score {
                font-size: 60px;
               
                color: #28a745;
            }
            .details p {
                margin: 8px 0;
                font-size: 18px;
                color: #555;
            }
            .student-info {
                text-align: center;
                margin-bottom: 10px;
                padding: 20px;
                background-color: #007bff;
                border-radius: 8px;
                color: #fff;
                max-width: 400px;
                margin: 0 auto;
            }
            .student-info p {
                margin: 5px 0;
                font-weight: bold;
                font-size: 18px;
            }
            .logo {
                width: 80px;
                height: auto;
                margin-top: 2px;
                margin-bottom: 10px;
            }
            .button {
                display: block;
               margin: 15px;
               text-decoration: none;
                padding: 15px 30px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
                transition: background-color 0.3s;
            }
            .button:hover {
                background-color: #0056b3;
            }
            .info-section {
                background-color: #007bff;
                padding: 10px;
                border-radius: 8px;
                margin-bottom: -15px;

            }
            @media print {
                /* Additional styles for print */
                .grp {
                    -webkit-print-color-adjust: exact; /* For Webkit-based browsers */
                    color-adjust: exact; /* Standard property for adjusting color */
                }
                button {
                    display: none !important;
                }
            }
            .grp{
                border: 2px solid #007bff; /* Defines a solid border with a width of 2px */
                border-radius: 10px;
                margin-top: -1px;
            }
            .func{
                display: flex;
                align-items: center;
                flex-direction: row;
                justify-content: center;
               
            }
           
            
        </style>
    </head>
    <body>
        <div class="result" id="result">
            <div class="top">
                <img src="Images/logo.png" alt="Logo" class="logo"> <!-- Replace this with your actual logo -->
                <h1>TestGuru</h1>
            </div>
            <div class="grp">
                <div class="info-section">
                    <div class="student-info">
                        <p>Student: <%= request.getSession().getAttribute("Student")%></p>
                        <p>Subject: <%= request.getSession().getAttribute("sub")%></p>
                    </div>
                </div>
                <br><br>
                <span class="score">Score: <%= request.getSession().getAttribute("score")%>%</span>
                <div class="details">
                    <p>Correct Answers: <%= request.getSession().getAttribute("correct_ques")%></p>
                    <p>Incorrect Answers: <%= request.getSession().getAttribute("incorrect_ques")%></p>
                    <p>Total Questions: <%= request.getSession().getAttribute("total_ques")%></p>
                    <p>Duration: 10 minutes</p>
                    <p>Date: <%= new java.util.Date()%></p>
                </div>

                <p class="footer">Thank you for taking the exam</p>
            </div>
        </div>
        <div class="func">
        <button class="button" onclick="window.print()">Print Result</button>
        <button class="button" onclick="downloadHTMLAsPDF()">Download PDF</button>
        <a href="index.jsp" class="button">Home</a>
        <a href="certificate.jsp" class="button">Certificate</a>
        </div>

<script>
function downloadHTMLAsPDF() {
     const element = document.getElementById('result');
            const opt = {
                margin: 0,
                filename: 'result.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
            };

            // Use html2pdf to generate the PDF
            html2pdf().from(element).set(opt).save();
        }

</script>
    </body>
</html>
