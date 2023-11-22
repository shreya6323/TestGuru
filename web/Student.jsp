<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>TestGuru</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
          <script src="https://cdn.tailwindcss.com"></script>
          <script src="https://kit.fontawesome.com/fdf05f1614.js" crossorigin="anonymous"></script>
                    
    </head>
   <body class="bg-gray-400">
    <nav class="bg-purple-600 px-2 sm:px-20 py-2.5 rounded dark:bg-gray-900">
        <div class="flex flex-wrap justify-between items-center mx-auto">
            <a href='Student' class='flex items-center'>
                <img src='Images/logo.png' class='mr-3 h-6 sm:h-9' alt='Flowbite Logo'>
            </a>
            <div class='flex items-center md:order-2'>
                <button type='button' class='flex mr-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600' id='user-menu-button' aria-expanded='false' data-dropdown-toggle='user-dropdown' data-dropdown-placement='bottom'>
                    <span class='sr-only'>Open user menu</span>
                    <img class='w-8 h-8 rounded-full' src='Images/y.jpg' alt='user photo'>
                </button>
                <!-- Dropdown menu -->
                <div class='hidden z-50 my-4 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600' id='user-dropdown' data-popper-reference-hidden='' data-popper-escaped='' data-popper-placement='bottom' style='position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(0px, 10.4px, 0px);'>
                    <div class='py-3 px-4'>
                        <span class='block text-sm text-gray-900 dark:text-white'>Sai Ram</span>
                        <span class='block text-sm font-medium text-gray-500 truncate dark:text-gray-400'>
                           <%= session.getAttribute("Student") %>
                        </span>
                    </div>
                    <ul class='py-1' aria-labelledby='user-menu-button'>
                        <li>
                            <a href='Student?choice=Profile' class='block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white'>Profile</a>
                        </li>
                        <li>
                            <a href='Student?choice=UpdateProfile' class='block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white'>Update Profile</a>
                        </li>
                        <li>
                            <a href='Student?choice=ChangePassword' class='block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white'>Change Password</a>
                        </li>
                        <li>
                            <a href='Logout' class='block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white'>Logout</a>
                        </li>
                    </ul>
                </div>
                <button data-collapse-toggle='mobile-menu-2' type='button' class='inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600' aria-controls='mobile-menu-2' aria-expanded='false'>
                    <span class='sr-only'>Open main menu</span>
                    <svg class='w-6 h-6' aria-hidden='true' fill='currentColor' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'>
                        <path fill-rule='evenodd' d='M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z' clip-rule='evenodd'></path>
                    </svg>
                </button>
            </div>
            <div class='hidden justify-between items-center w-full md:flex md:w-auto md:order-1' id='mobile-menu-2'>
                <ul class='flex flex-col p-4 mt-4 bg-orange-400 rounded-lg  md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium dark:bg-gray-800 md:dark:bg-gray-900 '>
                    <li>
                        <a href='Student?choice=StudentDashboard' class='block py-2 pr-4 pl-3 text-gray-700 rounded hover-bg-gray-100 md:hover-bg-transparent hover-text-blue-700 md:p-0 dark-text-gray-400 md:dark:hover-text-white dark-hover-bg-gray-700 dark-hover-text-white md:dark-hover-bg-transparent'>Home</a>
                    </li>
                    <li>
                        <a href='Student?choice=Exam' class='block py-2 pr-4 pl-3 text-gray-700 rounded hover-bg-gray-100 md:hover-bg-transparent hover-text-blue-700 md:p-0 dark-text-gray-400 md:dark:hover-text-white dark-hover-bg-gray-700 dark-hover-text-white md:dark-hover-bg-transparent'>Exam</a>
                    </li>
                    <li>
                        <a href='Student?choice=StudentResult' class='block py-2 pr-4 pl-3 text-gray-700 rounded hover-bg-gray-100 md:hover-bg-transparent hover-text-blue-700 md:p-0 dark-text-gray-400 md:dark:hover-text-white dark-hover-bg-gray-700 dark-hover-text-white md:dark-hover-bg-transparent'>Result</a>
                    </li>
                    <li>
                        <a href='Student?choice=GiveFeedback' class='block py-2 pr-4 pl-3 text-gray-700 rounded hover-bg-gray-100 md:hover-bg-transparent hover-text-blue-700 md:p-0 dark-text-gray-400 md:dark:hover-text-white dark-hover-bg-gray-700 dark-hover-text-white md:dark-hover-bg-transparent'>Feedback</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
       <div class='flex justify-center'>
    </body>
</html>
