<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<style>
    <%@include file="/resources/css/bootstrap.css" %>
    <%@include file="/resources/css/signin.css" %>
</style>
<t:template>
    <div id="userResults" align="center">
        Результаты ${username}:
        <table border="1">
            <tr>
                <th>Номер теста</th>
                <th>Ваш результат</th>
                <th>Дата и время</th>
            </tr>
            <tr>
                <td>
                    <c:forEach items="${test}" var="test">
                        ${test}
                        <br>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${currAnswers}" var="currAnswers">
                        ${currAnswers}
                        <br>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${time}" var="time">
                        ${time}
                        <br>
                    </c:forEach>
                </td>
            </tr>
        </table>
        <td>
            <br>

            <div style="text-align: center; width: 200px;">
                <a class="btn btn-lg btn-primary btn-block3" onclick="history.back()">Вернуться</a>
            </div>
        </td>
    </div>
</t:template>