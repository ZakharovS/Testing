<%@tag description="Template Tag" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.7.js></script>

<!doctype>
<html>
<head>
    <style>
        <%@include file="/resources/css/bootstrap.css" %>
        <%@include file="/resources/css/signin.css" %>
    </style>
    <script src="/resources/js/time.js"></script>
    <title>Главная</title>

    <div align="center">

        <div class="container" style="display: inline-table; margin-right: -30px; text-align: center; width: 200px;">
            <a href="/" class="btn btn-lg btn-primary btn-block3">Главная</a>
        </div>
        <div class="container" style="display: inline-table; margin-right: -30px; text-align: center; width: 200px;">
            <a href="/userProfile" class="btn btn-lg btn-primary btn-block3">${username}(кабинет)</a>
        </div>

        <div class="container" style="display: inline-table; margin-right: -30px; text-align: center; width: 200px;">
            <a href="/forum" class="btn btn-lg btn-primary btn-block3">Форум</a>
        </div>

        <div class="container" style="display: inline-table; text-align: center; width: 200px;">
            <c:url value="/j_spring_security_logout" var="logoutUrl"/>
            <a href="${logoutUrl}" class="btn btn-lg btn-primary btn-block3">Выход</a>
        </div>
        <div name="time" align="right" style="font-size: 35px; margin-right: 15%; color: aqua;">
        </div>
    </div>
    <br>
    <br>

</head>
<body>
<div>
    <jsp:doBody/>
</div>
</body>
</html>





