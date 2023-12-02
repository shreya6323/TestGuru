<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Certificate</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Comfortaa:wght@300&family=Roboto:wght@100&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
            }
            .certificate {
                width: 800px;
                height: 500px;
                margin: 50px auto;
                margin-top: 7px;
                margin-bottom: 2px;
                border: 5px solid #007bff;
                border-radius: 8px;
                position: relative;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            .certificate-header {
                background-color: #007bff;
                color: #fff;
                text-align: center;
                padding: 20px;
                font-size: 24px;
            }
            .certificate-content {
                padding: 40px;
                text-align: center;
            }
            .certificate-content p {
                font-size: 18px;

            }
            .certificate-footer {
                position: absolute;
                bottom: 0;
                width: 100%;
                background-color: #007bff;
                color: #fff;
                text-align: center;
                padding: 10px 0;
                font-size: 16px;
            }
            .top {
                display: flex;
                align-items: center;
                flex-direction: row;
                justify-content: center;
            }
            .logo {
                width: 80px;
                height: auto;
            }

            .font{
                font-family: 'Cedarville Cursive', cursive;
                font-size: 40px;
            }
            .button {
                display: block;
                margin:10px;
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
            .func{
                display: flex;
                align-items: center;
                flex-direction: row;
                justify-content: center;

            }
            .bold{
                font-weight: bold;
                font-size: 20px;
            }
            @media print {
                /* Additional styles for print */
                .certificate{
                    -webkit-print-color-adjust: exact; /* For Webkit-based browsers */
                    color-adjust: exact; /* Standard property for adjusting color */
                }
                button {
                    display: none !important;
                }
            }
        </style>
    </head>
    <body>
        <div class="certificate" id="certificate">
            <div class="certificate-header">
                Certificate of Achievement
            </div>
            <div class="certificate-content">
                <div class="top">
                    <img src="Images/logo.png" alt="Logo" class="logo"> <!-- Replace this with your actual logo -->
                    <h1>TestGuru</h1>
                </div>
                <p>This certifies that</p>
                <span class="bold"><%= request.getSession().getAttribute("Student")%></span>
                has successfully completed the
                <span class ="bold"><%= request.getSession().getAttribute("sub")%> Test</span>
                with <span class="bold"><%= request.getSession().getAttribute("score")%>%</span>
                <br><br>
                <!-- Signature placeholder -->
                Signature : <div class='font'>TestGuru</div>
            </div>
            <div class="certificate-footer">
                Presented on <%= new java.util.Date()%>
            </div>
        </div>
        <div class="func">
            <button class="button" onclick="window.print()">Print Certificate</button>
            <button class="button" onclick="downloadHTMLAsPDF()">Download PDF</button>
              <a href="index.jsp" class="button">Home</a>
        </div>


        <script>
            function downloadHTMLAsPDF() {
                const element = document.getElementById('certificate');
                const opt = {
                    margin: 10,
                    filename: 'certificate.pdf',
                  
                    html2canvas: {scale: 2},
                    jsPDF: {unit: 'mm', format: 'a4', orientation: 'landscape'}
                };

                // Use html2pdf to generate the PDF
                html2pdf().from(element).set(opt).save();
            }

        </script>
    </body>
</html>
