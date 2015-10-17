<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Аутентификация пользователя</title>
    <style>
        <%@include file="/resources/css/bootstrap.css" %>
        <%@include file="/resources/css/signin.css" %>
    </style>
</head>
<body>
<br/> <br/> <br/> <br/>

<div class="container" style="text-align: center; width: 250px;">

    <h2 style="text-align: center">Вход:</h2>

    <form method="post" action="<c:url value='/j_spring_security_check' />">

        <table>
            <tr>
                <%--<td>Логин:</td>--%>
                <td><input type="text" name="username" placeholder="Логин" class="btn btn-lg btn-primary btn-block3"
                           style="color: black; background-color: #ffffff;"/>
                </td>
            </tr>
            <tr>
                <%--<td>Пароль:</td>--%>
                <td><input type="password" name="password" placeholder="Пароль"
                           class="btn btn-lg btn-primary btn-block3" style="color: black; background-color: #ffffff;"/>
                </td>
            </tr>
            <tr>
                <%--<td>&nbsp;</td>--%>
                <td><input type="submit" value="Подтвердить" class="btn btn-lg btn-primary btn-block3"/>
                </td>
            </tr>

            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td>
                    <a href="/registration" class="btn btn-lg btn-primary btn-block3">Регистрация</a>
                </td>
            </tr>

            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td>
                    <button id="clear" class="btn btn-lg btn-primary btn-block3" type="reset">Очистить</button>
                </td>
            </tr>
        </table>

    </form>

</div>
</body>
</html>