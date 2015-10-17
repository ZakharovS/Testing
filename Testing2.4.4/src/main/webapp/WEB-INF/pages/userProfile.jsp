<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<style>
    <%@include file="/resources/css/bootstrap.css" %>
    <%@include file="/resources/css/signin.css" %>
</style>
<t:template>
    <div align="center">
        <h2>Личный кабинет:</h2>
        <br>

        <form method="post" action="/userProfile">

            <table border="1" class="btn-block3" style="text-align: center; width: 400px;">
                <tr>
                    <td>Логин</td>
                    <td>${username}</td>
                </tr>
                <tr>
                    <td>Пароль</td>
                    <td><input type="text" class="btn-block3" name="password" value="${password}"
                               style="text-align: center; background-color: #ffffff"/></td>
                </tr>
                <tr>
                    <td>Никнейм</td>
                    <td><input type="text" class="btn-block3" name="nickName" value="${nickname}"
                               style="text-align: center; background-color: #ffffff"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" class="btn-block3" name="eMail" value="${email}"
                               style="text-align: center; background-color: #ffffff"/></td>
                </tr>
                <tr>
                    <td>Статус</td>
                    <td>${userrole}</td>
                </tr>
            </table>
            <td>
                <br>
                <br>
            </td>
            <td>
                <div style="text-align: center; width: 200px;">
                    <input type="submit" value="Сохранить" class="btn btn-lg btn-primary btn-block3"/>
                </div>
            </td>

        </form>

        <br>
        <br>

        <div style="text-align: center; width: 200px;">
            <a class="btn btn-lg btn-primary btn-block3" onclick="history.back()">Вернуться</a>
        </div>
        </td>
    </div>
</t:template>