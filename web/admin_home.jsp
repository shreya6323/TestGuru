<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="expires" content="0">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
    <script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/fdf05f1614.js" crossorigin="anonymous"></script>
       <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@400;700&display=swap">
    <style>
          .playscript-text {
    font-family: 'Comfortaa', serif;
    font-size: 20px; /* Set your desired font size */
   align-items: left;
  
   color:#2ecc71;
  }
    </style>
</head>
 
<body class="bg-gray-400">
    <nav class="bg-purple-600 px-2 sm:px-20 py-2.5 rounded dark:bg-gray-900">
        <div class="flex flex-wrap justify-between items-center ">
            <div class="row flex">
            <a href="admin_home.html" class="flex items-center">
                <img src="Images/logo.png" class="mr-3 h-6 sm:h-9" alt="Testguru Logo">
            </a>
           
             <a class="playscript-text" style="padding-left: -1;" href='admin_home.html'>TestGuru</a>
             </div>
            <div class="flex items-center md:order-2">
                <button type="button" class="flex mr-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown" data-dropdown-placement="bottom">
                    <span class="sr-only">Open user menu</span>
                    <img class="w-8 h-8 rounded-full" src="Images/y.jpg" alt="user photo">
                </button>
                <!-- Dropdown menu -->
                <div class="hidden z-50 my-4 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600" id="user-dropdown" data-popper-reference-hidden="" data-popper-escaped="" data-popper-placement="bottom" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(0px, 10.4px, 0px);">
                    <div class="py-3 px-4">
                        <span class="block text-sm text-gray-900 dark:text-white">Hi,</span>
                        <span class="block text-sm font-medium text-gray-500 truncate dark:text-gray-400">
                           <%=  request.getSession(false).getAttribute("Admin") %>
                        </span>
                    </div>
                    <ul class="py-1" aria-labelledby="user-menu-button">
                        <li>
                            <a href="AdminHome?choice=Profile" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Profile</a>
                        </li>
                        
                        <li>
                            <a href="AdminLogout" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Logout</a>
                        </li>
                    </ul>
                </div>
                <button data-collapse-toggle="mobile-menu-2" type="button" class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="mobile-menu-2" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </button>
            </div>
            <div class="hidden justify-between items-center w-full md:flex md:w-auto md:order-1" id="mobile-menu-2">
                <ul class="flex flex-col p-4 mt-4 bg-orange-400 rounded-lg  md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium dark:bg-gray-800 md:dark:bg-gray-900 ">
                    <li>
                        <a href="admin_home.jsp" class="block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent ">Home</a>
                    </li>
                    <li>
                        <button id="dropdownNavbarLink" data-dropdown-toggle="DropdownExams" class="flex justify-between items-center py-2 pr-4 pl-3 w-full font-medium text-gray-700  hover:bg-gray-50 md:hover:bg-transparent  hover:text-blue-700 md:p-0 md:w-auto dark:text-gray-400 dark:hover:text-white dark:focus:text-white  dark:hover:bg-gray-700 md:dark:hover:bg-transparent">Manage Exams <svg class="ml-1 w-4 h-4" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg></button>
                        <!-- Dropdown menu -->
                        <div id="DropdownExams" class="hidden z-10 w-44 font-normal bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                            <ul class="py-1 text-sm text-gray-700 dark:text-gray-400" aria-labelledby="dropdownLargeButton">
                                <li>
                                    <a href="add_question.html" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Add Questions</a>
                                </li>
                                <li>
                                    <a href="update_ques_req.html" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Update Questions</a>
                                </li>
                                <li>
                                    <a href="delete_ques_req.html" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Delete Questions</a>
                                </li>
                                
                                 <li>
                                    <a href="ques_list_form.html" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">View QuestionList</a>
                                </li>  
                                
                            </ul>
                        </div>
                    </li>
                     <li>
                         <form action="View_feed.jsp" method="post">
                        <input type="submit" class="block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent" value="View Feedback"/>
                         </form>
                         </li>
                    <li>
                        <button id="dropdownNavbarLink" data-dropdown-toggle="DropdownStudents" class="flex justify-between items-center py-2 pr-4 pl-3 w-full font-medium text-gray-700 hover:bg-gray-50 md:hover:bg-transparent  hover:text-blue-700 md:p-0 md:w-auto dark:text-gray-400 dark:hover:text-white dark:focus:text-white  dark:hover:bg-gray-700 md:dark:hover:bg-transparent">Manage Students <svg class="ml-1 w-4 h-4" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg></button>
                        <!-- Dropdown menu -->
                        <div id="DropdownStudents" class="hidden z-10 w-44 font-normal bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                            <ul class="py-1 text-sm text-gray-700 dark:text-gray-400" aria-labelledby="dropdownLargeButton">
                                <li>
                                    <a href="StudentList" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Students List</a>
                                </li>
                                <li>
                                    <a href="update_student_req.html" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Update Student</a>
                                </li>
                                <li>
                                    <a href="delete_student.html" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Delete Student</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                   <li>
    <button id="ResultButton" data-dropdown-toggle="Result" class=" flex justify-between items-center py-2 pr-4 pl-3 font-medium text-gray-700 hover:bg-gray-50 md:hover:bg-transparent hover:text-blue-700 md:p-0 md:w-auto dark:text-gray-400 dark:hover:text-white dark:focus:text-white dark:hover:bg-gray-700 md:dark:hover:bg-transparent">
    Result
    <svg class="ml-1 w-4 h-4" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
    </svg>
</button>

                                   
    <!-- Dropdown menu for Result -->
    <div id="Result" class="hidden z-10 w-44 font-normal bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
        <ul class="py-1 text-sm text-gray-700 dark:text-gray-400" aria-labelledby="ResultButton">
            <li>
                <a href="AdminHome?choice=Math" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Math</a>
            </li>
            <li>
                <a href="AdminHome?choice=Science" class="block py-2 px-4 hover:text-blue-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Science</a>
            </li>
            <!-- Add more sub-menu items as needed -->
        </ul>
    </div>
 </li>
                </ul>
            </div>
        </div>
    </nav>
   
</body>
</html>
