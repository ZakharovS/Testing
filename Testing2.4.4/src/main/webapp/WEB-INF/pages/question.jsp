<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    <%@include file="/resources/css/bootstrap.css" %>
    <%@include file="/resources/css/signin.css" %>
</style>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.7.js></script>

<div id="question" align="center">
    Вопрос: <br>
<textarea cols="60" rows="5" class="vopros">
    ${question.question}

</textarea>
    <br>

    <div style="width: 400px; text-align: left">
        <c:forEach items="${answ}" var="answ">
            <input type="radio" name="answer" value="${answ.id}">${answ.answer}
            <br>
        </c:forEach>
    </div>
</div>