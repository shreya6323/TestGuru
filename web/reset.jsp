<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='shortcut icon' href='Images/logo.png' type='image/x-icon'>
    <link rel='apple-touch-icon' href='Images/logo.png'>
    <script src='https://unpkg.com/flowbite@1.5.3/dist/flowbite.js'></script>
    <script src='https://cdn.tailwindcss.com'></script>
    <script src='https://kit.fontawesome.com/fdf05f1614.js' crossorigin="anonymous"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f3f4f6; /* Add a background color */
        }
        
        .login-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 80%; /* Adjust the width as needed */
            max-width: 400px; /* Set a max-width for larger screens */
            height: 70%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    </style>
    <title>Reset Password</title>
</head>
<body class="bg-gray-400">

 <div class='rounded-lg shadow dark:border w-1/2 h-9/10 dark:bg-gray-800 dark:border-gray-700 flex items-start'>
      
        <div class='px-8 sm:px-8 py-3'>
            <h1 class='text-xl my-3  mx -3 font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white'>
                Reset Password
            </h1>
            <form class='space-y-4' action='resetPassword'>
              
                <div class='mb-4'>
                    <label for='newpass' class='block mb-2 text-sm font-medium text-gray-900 dark:text-white'>Password</label>
                    <input type='text' name='newpass' id='newpass' class=' bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block py-3 px-10 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500' required=''>
                </div>
              
     
               
               <!-- ... (previous code) ... -->
<button type='submit' class='text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-8 py-3 text-center dark-bg-blue-600 dark-hover-bg-blue-700 dark-focus-ring-blue-800' style='margin-bottom: 20px;'>Reset</button>
<!-- ... (remaining code) ... -->

            </form>
           
        </div>
       <img src="Images/logo.png" class=" w-1/3 h-1/3 m-12" alt="Testguru Logo">
  </div>
</body>
</html>
