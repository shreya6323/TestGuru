<!DOCTYPE html>
<html>
    <head>
        <title>TestGur</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@400;700&display=swap">
        <style>
            body {
                background-color:#CBD5E0;
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
            }

            img {
                width: 100px; /* Adjust the image width */
                height: auto; /* Maintain aspect ratio */
                margin-bottom: 20px;
            }

            h2 {
                margin: 0;
                font-family:'Comfortaa';
            }
        </style>
    </head>
    <body>
        <img src="Images/logo.png" alt="Testguru Logo">
        <div>
    <% if(request.getParameter("msg") == null) { %>
        <h2><%= request.getAttribute("msg") %></h2>
    <% } else { %>
        <h2><%= request.getParameter("msg") %></h2>
    <% } %>
</div>

    </body>
</html>
