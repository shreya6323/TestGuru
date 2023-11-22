<%-- 
    Document   : msg_error
    Created on : 22-Sep-2023, 10:11:57 pm
    Author     : shreya gandhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_home.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TestGuru</title>
    </head>
    <body class="bg-gray-400">
        <div class='relative w-full'>
    <div id='toast-warning' class='absolute top-5 right-5 flex items-center p-4 w-full max-w-xs text-white bg-red-600 rounded-lg shadow dark:text-gray-400 dark:bg-gray-800' role='alert'>
        <div class='inline-flex flex-shrink-0 justify-center items-center w-8 h-8  rounded-lg '>
            <svg xmlns='http://www.w3.org/2000/svg' class='w-8 h-8 text-red-600' viewBox='0 0 20 20' fill='currentColor'>
                <path fill-rule='evenodd' d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z' clip-rule='evenodd'></path>
            </svg>
            <span class='sr-only'>Warning icon</span>
        </div>
        <div class='ml-3 text-sm font-normal'>
            <!-- Your warning message here -->
            <%= request.getAttribute("msg") %>
        </div>
        <button type='button' class='ml-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700' data-dismiss-target='#toast-warning' aria-label='Close'>
            <span class='sr-only'>Close</span>
            <svg aria-hidden='true' class='w-5 h-5' fill='currentColor' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'>
                <path fill-rule='evenodd' d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z' clip-rule='evenodd'></path>
            </svg>
        </button>
    </div>
</div>
        <div class='flex justify-center'>

    </body>
</html>
