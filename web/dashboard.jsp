<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<script src='https://cdn.tailwindcss.com'></script>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <style>
            .certificate-icon {
                font-size: 24px;
               /* Change the color as needed */
                text-decoration: none; /* Remove underline for the link */
            }
            body{
                
                text-align: center;
                 
            }
            
            .heading{
                font-size: 40px;
                color:#1F2937;
             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
        </style>
    </head>
    <body  class="bg-gray-400">
        <sql:setDataSource var="my_data" driver="org.postgresql.Driver"
                           url="jdbc:postgresql://localhost:5432/postgres" user="postgres" password="postgres"/>


        <sql:query dataSource="${my_data}" var="user">
            Select * from information_schema.exam where username=?
            <sql:param value="Student" />
        </sql:query>
           
                <h1 class="heading">Dashboard</h1>
          
        <div class='overflow-x-auto shadow-lg sm:rounded-lg mx-3 my-3'>
            <table class='w-full rounded-lg text-sm text-left text-gray-600 dark:text-gray-400'>
                <thead class='text-xs text-gray-700 uppercase bg-blue-600 dark:bg-gray-700 dark:text-gray-400'>
                    <tr>

                        <th scope='col' class='py-3 px-6'>
                            Subject
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Total Ques
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Correct Ques
                        </th>
                        <!-- comment -->
                        <th scope='col' class='py-3 px-6'>
                            Score
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Date
                        </th>
                        <th scope='col' class='py-3 px-6'>
                            Certificate
                        </th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ques" items="${user.rows}" >
                        <tr class='bg-teal-400 border-y border-gray-500 dark:bg-gray-800 dark:border-gray-700 hover:bg-teal-200 dark:hover:bg-gray-600'>
                            <th scope='row' class='py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white'>
                                <c:out value="${ques.subject}" />
                            </th>
                            <td class='py-4 px-6'>
                                <c:out value="${ques.total_ques}" />
                            </td>


                            <td class='py-4 px-6'>
                                <c:out value="${ques.correct_ques}" />
                            </td>
                            <td class='py-4 px-6'>
                                <c:out value="${ques.score}" />
                            </td>
                            <td class='py-4 px-6'>
                                <c:out value="${ques.date}" />
                            </td><!-- comment -->
                            <td class='py-4 px-6'>
<c:set var="sub" value="${ques.subject}" scope="session" />
<c:set var="score" value="${ques.score}" scope="session" />
                                <a href="certificate.jsp" class="certificate-icon">
                                   <i class="far fa-file-alt"></i>

                                </a>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
