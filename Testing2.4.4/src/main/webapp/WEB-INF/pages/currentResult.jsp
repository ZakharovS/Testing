<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    <%@include file="/resources/css/bootstrap.css" %>
    <%@include file="/resources/css/signin.css" %>
</style>
<div id="result" align="center" style="margin-left: -50%; width: 900px">
    <table border="1">
        <tr>
            <th>Вопросы</th>
            <th>Ваши ответы</th>
            <th>Правильные ответы</th>
        </tr>
        <tr>
            <td>
                <c:forEach items="${questions}" var="questions">
                    ${questions}
                    <br>
                    <br>
                </c:forEach>
            </td>

            <td>
                <c:forEach items="${currAnswers}" var="currAnswers">
                    ${currAnswers}
                    <br>
                    <br>
                </c:forEach>
            </td>

            <td>
                <c:forEach items="${correctAnswers}" var="correctAnswers">
                    ${correctAnswers}
                    <br>
                    <br>
                </c:forEach>
            </td>
        </tr>
    </table>
    <h1 style="color: aqua">
        Вы правильно ответили на ${result} вопросов, и набрали ${result} очков!!!
    </h1>
</div>