<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Регистрация</title>

    <style>
        <%@include file="/resources/css/bootstrap.css" %>
        <%@include file="/resources/css/signin.css" %>
    </style>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script src="js/jquery-1.7.2.js"></script>


</head>

<body>
<br/> <br/> <br/> <br/>

<div class="container" style="text-align: center; width: 250px;">

    <h2 style="text-align: center">Регистрирация:</h2>

    <form method="post" action="/registration">

        <table>
            <tr>
                <td><input type="text" name="userName" placeholder="Логин" class="btn btn-lg btn-primary btn-block3"
                           style="color: black; background-color: #ffffff;"/>
                </td>
            </tr>
            <tr>
                <td><input type="password" name="password" placeholder="Пароль"
                           class="btn btn-lg btn-primary btn-block3" style="color: black; background-color: #ffffff;"/>
                </td>
            </tr>
            <tr>
                <td><input type="text" name="nickName" placeholder="Отображаемое имя"
                           class="btn btn-lg btn-primary btn-block3" style="color: black; background-color: #ffffff;"/>
                </td>
            </tr>
            <tr>
                <td><input type="email" name="eMail" placeholder="Email" class="btn btn-lg btn-primary btn-block3"
                           style="color: black; background-color: #ffffff;"/>
                </td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><input type="submit" value="Сохранить" class="btn btn-lg btn-primary btn-block3"/>
                </td>
            </tr>

            <tr>
                <td><br><br></td>
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