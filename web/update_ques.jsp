<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Question</title>
        <!-- Add your CSS links and JavaScript scripts here -->
        <script src='https://unpkg.com/flowbite@1.5.3/dist/flowbite.js'></script>
        <script src='https://cdn.tailwindcss.com'></script>
        <script src='https://kit.fontawesome.com/fdf05f1614.js' crossorigin="anonymous"></script>
    </head>
    <body class="bg-gray-400">
        <div class="md:mx-20 md:my-16 sm:my-9 sm:mx-6 my-7 mx-5 ">
            <div class="bg-white rounded-lg shadow dark:border md:mt-0 xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="px-6 sm:px-8 py-4">
                    <h1 class="text-xl text-center font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                        Update Question
                    </h1>
                    <% java.sql.ResultSet questionResultSet = (java.sql.ResultSet) request.getAttribute("update_ques_info");%>
                    <form class="space-y-2" action="UpdateQuestion" method="post">
                        <label for="sub" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email Id</label>
                        <span id="sub" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg p-2.5 block w-full dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
                            <%= request.getParameter("sub")%>

                        </span>

                        <label for="queid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email Id</label>
                        <span id="queid" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg p-2.5 block w-full dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
                            <%= request.getParameter("queid")%>
                        </span>
                        <input type="hidden" name="queid" value="<%= request.getParameter("queid") %>"><!-- comment -->
                        <input type="hidden" name="sub" value="<%= request.getParameter("sub") %>">
                        <div>
                            <label for="que" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Question</label>
                            <input value="<%=questionResultSet.getString(2) %>" type="text" name="que" id="que" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Question" required="">
                        </div>
                        <div class="flex justify-between space-x-4">
                            <div class="w-full">
                                <label for="opt1" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Option1</label>
                                <input value="<%= questionResultSet.getString(3) %>" type="text" name="opt1" id="opt1" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Option1" required="">
                            </div>
                            <div class="w-full">
                                <label for="opt2" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Option2</label>
                                <input value="<%=questionResultSet.getString(4) %>" type="text" name="opt2" id="opt2" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Option2" required="">
                            </div>
                        </div>
                        <div class="flex justify-between space-x-4">
                            <div class="w-full">
                                <label for="opt3" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Option3</label>
                                <input value="<%= questionResultSet.getString(5) %>" type="text" name="opt3" id="opt3" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Option3" required="">
                            </div>
                            <div class="w-full">
                                <label for="opt4" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Option4</label>
                                <input value="<%=questionResultSet.getString(6) %>" type="text" name="opt4" id="opt4" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Option4" required="">
                            </div>
                        </div>
                        <div>
                            <label for="ans" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Answer</label>
                            <input value="<%= questionResultSet.getString(7) %>" type="text" name="ans" id="ans" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Please Enter Answer" required="">
                        </div>
                        <div>

                        </div>
                        <button type="submit" class="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update Question</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

