<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Exam Rules</title>
          <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #1F2937;
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            h {
                text-align: center;
                margin-bottom: 20px;
                color:#10B981;
             
                font-size: 30px;
            }

           

            .rules-list ul {
               list-style: disc;
                margin-left: 30px;
            }

            .rules-list ul li {
                margin-bottom: 10px;
                color: white;
            }

            .emphasis {
               
                color:#10B981;

            }

            .good-luck {
                text-align: center;
                font-style: italic;
                color:#10B981;
                font-size: 25px;
                margin-bottom: 20px;
            }

            .disclaimer {
                margin-top: 40px;
                font-style: italic;
                font-size: 14px;
               color: grey;
            }
        </style>
    </head>
   

    <body>
        <h>Exam Rules</h>
      <%
    String subValue = request.getParameter("sub");
    if(subValue != null) {
        // If 'sub' parameter exists, set it in the session
        request.getSession().setAttribute("sub", subValue);
    }
%>

        <div class="rules-list">
            <ul>
                <li><span class="emphasis">Time Limit:</span> The exam has a time limit of 10 minutes. Manage your time
                    effectively.</li>
                <li><span class="emphasis">Question Format:</span> The exam consists of multiple-choice and/or essay-type
                    questions with no NEGATIVE marking.</li>
                <li><span class="emphasis">Answer Submission:</span> Submit your answers within the specified time frame. Late
                    submissions will not be accepted.</li>
                <li><span class="emphasis">Single/Multiple Choices:</span> Follow instructions for each question type. For
                    multiple-choice questions, select one or more correct answers as specified.</li>
                <li><span class="emphasis">Technical Requirements:</span> Ensure a stable internet connection and compatible
                    browser. Contact support for technical issues immediately.</li>
                <li><span class="emphasis">Honesty Policy:</span> Attempt the exam individually. Avoid seeking or providing
                    assistance from/to others.</li>
                <li><span class="emphasis">Communication:</span> Maintain silence and focus during the exam duration.</li>
                <li><span class="emphasis">Violation of Rules:</span> Any violation of exam rules may result in disqualification
                    from the exam.</li>
            </ul>
        </div>

        <div class="good-luck">
            <p>Best of luck with your exam!</p>
        </div>
        <form action="exam.jsp" >
 <input type="submit" value="Start" class="bg-green-500 text-white px-4 py-2 rounded shadow hover:bg-green-600 cursor-pointer">
</form>
        <div class="disclaimer">
            <p>Disclaimer: Please note that these rules are subject to change based on the exam guidelines provided by the
                institution or exam conducting authority.</p>
        </div>
    </body>

</html>
