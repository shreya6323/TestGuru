<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="admin_home.html"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question List</title>
</head>
<body class="bg-gray-400">
    <div class='overflow-x-auto shadow-lg sm:rounded-lg mx-3 my-3'>
        <table class='w-full rounded-lg text-sm text-left text-gray-600 dark:text-gray-400'>
            <thead class='text-xs text-gray-700 uppercase bg-blue-600 dark:bg-gray-700 dark:text-gray-400'>
                <tr>
                    <th scope='col' class='py-3 px-6'>
                        Email
                    </th>
                    <th scope='col' class='py-3 px-6'>
                        Username
                    </th>
                    <th scope='col' class='py-3 px-6'>
                       Feedback
                    </th>
                  
                </tr>
            </thead>
            <tbody>
                <c:forEach var="list" items="${requestScope.feedbackList}" >
                    <tr class='bg-teal-400 border-y border-gray-500 dark:bg-gray-800 dark:border-gray-700 hover:bg-teal-200 dark:hover:bg-gray-600'>
                        <th scope='row' class='py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white'>
                             <c:out value="${list.Email()}" />
                        </th>
                        <td class='py-4 px-6'>
                            <c:out value="${list.getUsername()}" />
                        </td>
                        <td class='py-4 px-6'>
                          <c:out value="${list.getMsg()}" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
