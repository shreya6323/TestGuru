<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ include file="admin_home.jsp"%>
<%@ page import="QandA.Question" %>
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
                        Id
                    </th>
                    <th scope='col' class='py-3 px-6'>
                        Question
                    </th>
                    <th scope='col' class='py-3 px-6'>
                        Option 1
                    </th>
                    <th scope='col' class='py-3 px-6'>
                        Option 2
                    </th>
                    <th scope='col' class='py-3 px-6'>
                        Option 3
                    </th>
                    <th scope='col' class='py-3 px-6'>
                        Option 4
                    </th>
                    <th scope='col' class='py-3 px-6'>
                        Answer
                    </th>
                    <th scope='col' class='py-3 px-6 text-center'>
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ques" items="${requestScope.questionList}" >
                    <tr class='bg-teal-400 border-y border-gray-500 dark:bg-gray-800 dark:border-gray-700 hover:bg-teal-200 dark:hover:bg-gray-600'>
                        <th scope='row' class='py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white'>
                             <c:out value="${ques.getQueid()}" />
                        </th>
                        <td class='py-4 px-6'>
                            <c:out value="${ques.getQue()}" />
                        </td>
                        <td class='py-4 px-6'>
                          <c:out value="${ques.getOp1()}" />
                        </td>
                        <td class='py-4 px-6'>
                             <c:out value="${ques.getOp2()}" />
                        </td>
                        <td class='py-4 px-6'>
                            <c:out value="${ques.getOp3()}" />
                        </td>
                        <td class='py-4 px-6'>
                              <c:out value="${ques.getOp4()}" />
                        </td>
                        <td class='py-4 px-6'>
                           <c:out value="${ques.getAns()}" />
                        </td>
                        <td class='flex items-center py-4 px-6 space-x-3'>
                            <a href='UpdateQuestion?sub=${ques.getSub()}&queid=${ques.getQueid()}' class='font-medium text-pink-600 dark:text-blue-500'>
                                <i class='fa-solid text-lg fa-user-pen'></i>
                            </a>
                                

                            <a href='DeleteQuestion?sub=${ques.getSub()}&queid=${ques.queid}' class='font-medium text-red-600 dark:text-red-500'>
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
