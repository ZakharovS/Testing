<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.7.js></script>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <style>
        <%@include file="/resources/css/bootstrap.css" %>
        <%@include file="/resources/css/signin.css" %>
    </style>

    <div id="content" align="center" class="container" style="text-align: center; width: 300px;">
        <div style="font-size: large; font-style: inherit;">
            Привет, ${nickName}!
        </div>
        <br>

        <div style="font-size: medium; font-style: italic">
            Считаешь, что все знаешь об украинском законодательстве?
            <br>
            Сейчас проверим. Пройди наши тесты.
        </div>

        <br>
        <br>
        <a href="/showtest" id="begtest" class="btn btn-lg btn-primary btn-block3">Выбрать тест</a>

        <br>
        <br>

        <div align="center" class="container" style="text-align: center; width: 200px;">
            <a href="/userResults" id="myresults" class="btn btn-lg btn-primary btn-block3">Мои результаты</a>

            <br>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="/edit" class="btn btn-lg btn-primary btn-block3">Редактировать</a>
            </sec:authorize>
        </div>
    </div>
    <div id="joke" align="center" style="color: aqua; font-size: 35px"></div>

</t:template>

<script type="text/javascript">
    $("#joke").ready(function () {

        $.ajax({
            type: "GET",
            contentType: charset = "utf-8",
            url: "/takeJoke",
            success: function (data) {
                document.getElementById('joke').innerHTML = data;
            }
        });
        window.setTimeout(arguments.callee, 5000);
    });
</script>