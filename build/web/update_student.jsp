
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TestGuru</title>
       <link rel='shortcut icon' href='Images/logo.png' type='image/x-icon'>
    <link rel='apple-touch-icon' href='Images/logo.png'>    
         <script src='https://unpkg.com/flowbite@1.5.3/dist/flowbite.js'></script>
       <script src='https://cdn.tailwindcss.com'></script>
       <script src='https://kit.fontawesome.com/fdf05f1614.js' crossorigin="anonymous"></script>
    
</head>
<body class="bg-gray-400">
  <div class="flex items-center justify-center h-screen">

        <div class="bg-white rounded-lg shadow dark:border md:mt-0 xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div class="px-6 sm:px-8 py-4">
                <h1 class="text-xl text-center font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                    Update Student
                </h1>
                  <% java.sql.ResultSet studentResultSet = (java.sql.ResultSet) request.getAttribute("student_for_updation");%>
                <form class="space-y-2" action="UpdateStudent_2" method="post">
                   <div>
    <label for="emails" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email Id</label>
    <span id="emails" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg p-2.5 block w-full dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
        <%= request.getParameter("email")%>
       
    </span>
         
</div>
<input type="hidden" name="email" value="<%= studentResultSet.getString("email") %>">

                    <div class="flex justify-between space-x-4">
                        <div class="w-full">
                            <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Name</label>
                            <input type="text" name="name" value="<%= studentResultSet.getString(2)%>" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Name" required="">
                        </div>
                        <div class="w-full">
                            <label for="qua" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Qualification</label>
                            <input type="text" name="qua" value="<%= studentResultSet.getString(3)%>" id="qua" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Qualification" required="">
                        </div>
                    </div>
                    <div class="flex justify-between space-x-4">
                        <div class="w-full">
                            <label for="dob" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Date Of Birth</label>
                            <input type="date" name="dob" value="<%= studentResultSet.getString(4)%>" id="dob" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Date Of Birth" required="">
                        </div>
                        <div class="w-full">
                            <label for="gender" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Gender</label>
                            <input type="text" name="gender" value="<%= studentResultSet.getString(5)%>" id="gender" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Gender" required="">
                        </div>
                    </div>
                  
               
                    <button type="submit"  class="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update Student</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

    

