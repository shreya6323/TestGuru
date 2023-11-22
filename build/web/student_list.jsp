<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="Student.Student_data" %>
<%@ include file="admin_home.html"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student List</title>

        <script src='https://unpkg.com/flowbite@1.5.3/dist/flowbite.js'></script>
        <script src='https://cdn.tailwindcss.com'></script>
        <script src='https://kit.fontawesome.com/fdf05f1614.js' crossorigin="anonymous"></script>
    </head>
    <body class="bg-gray-400">
        <div class='overflow-x-auto shadow-md sm:rounded-lg mx-3 my-3'>
            <table class='w-full text-sm text-left text-gray-500 dark:text-gray-400 bg-red-700'>
                <thead class='text-xs text-gray-700 bg-blue-600 uppercase dark:bg-gray-700 dark:text-gray-400'>
                    <tr>
                        <th scope='col' class='py-3 px-6'>
                            Email
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Name
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Qualification
                        </th><!-- comment -->
                        <th scope='col' class='py-3 px-6'>
                            Dob
                        </th><!-- comment --><th scope='col' class='py-3 px-6'>
                            Gender
                        </th><!-- comment -->
                        <th scope='col' class='py-3 px-6'>
                            Contact
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Password
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Action
                        </th>
                       
                    </tr>
                </thead>
                <tbody>

                <c:forEach var="stu" items="${requestScope.ListofStudents}">
                    <tr class='bg-teal-400 border-y border-gray-500 dark:bg-gray-800 dark:border-gray-700 hover:bg-teal-200 dark:hover:bg-gray-600'>
                        <td class='py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white'>
                    <c:out value="${stu.getEmail()}" />
                    </td>
                    <td class='py-4 px-6'>
                    <c:out value="${stu.getName()}" />
                    </td>
                    <td class='py-4 px-6'>
                    <c:out value="${stu.getQua()}" />
                    </td><!-- comment -->
                    <td class='py-4 px-6'>
                    <c:out value="${stu.getDob()}" />
                    </td><!-- comment -->
                    <td class='py-4 px-6'>
                    <c:out value="${stu.getGender()}" />
                    </td><!-- comment -->
                    <td class='py-4 px-6'>
                    <c:out value="${stu.getContact()}" />
                    </td><!-- comment -->
                    <td class='py-4 px-6'>
                    <c:out value="${stu.getPassword()}" />
                    </td>
                       <td class='flex items-center py-4 px-6 space-x-3'>
                            <a href='UpdateStudent?email=${stu.getEmail()}' class='font-medium text-pink-600 dark:text-blue-500'>
                                <i class='fa-solid text-lg fa-user-pen'></i>
                            </a>
                                

                            <a href='DeleteStudent?delemail=${stu.getEmail()}' class='font-medium text-red-600 dark:text-red-500'>
                                <i class='fa-solid text-lg fa-trash'></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>



