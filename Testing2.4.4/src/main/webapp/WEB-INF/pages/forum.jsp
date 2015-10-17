<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.7.js></script>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Форум</title>
    <style>
        <%@include file="/resources/css/bootstrap.css" %>
        <%@include file="/resources/css/signin.css" %>
    </style>

</head>

<body>
<t:template>

    <table border="1" align="center" class="btn-block3" style="text-align: left; width: 600px;">
        <tr align="center">
            <td>
                Сообщение
            </td>
            <td>
                Запостил
            </td>
            <td>
                Дата и время
            </td>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <td>
                    Удалить
                </td>
            </sec:authorize>
        </tr>
        <c:forEach items="${posts}" var="posts">
            <tr>

                <td>
                        ${posts.post}
                </td>
                <td>
                        ${posts.userName}
                </td>
                <td>
                        ${posts.time}
                </td>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td>
                        <input id="deleteMessage" type="button" value="Удалить" style="color: #d9534f; width: 100%;"
                               onclick="deleteMessage(${posts.id})">
                    </td>
                </sec:authorize>
            </tr>
        </c:forEach>
    </table>
    <br>
    <br>


    <div align="center">

        <textarea id="message" cols="50" placeholder="Сообщение" style="text-align: center; width: 300px;"></textarea>

        <br>
        <br>

        <input id="addMessage" type="button" value="Добавить сообщение" class="btn btn-lg btn-primary btn-block3"
               style="color: #4cae4c; width: 300px;" onclick="addMessage()">

        <br>
        <br>


        <div style="text-align: center; width: 200px;">
            <a align="center" class="btn btn-lg btn-primary btn-block3" onclick="history.back()">Вернуться</a>
        </div>
    </div>
</t:template>
</body>
</html>

<script type="text/javascript">

    function addMessage() {
        var mes = $("#message").val();
        if (mes != '') {
            $.ajax({
                type: "POST",
                url: "/addMessage",
                data: {
                    message: mes
                },
                success: function (html) {
                    window.location.reload();
                },
                error: function () {
                    alert(mes);
                }
            });
        } else alert("Введите сообщение");
    }

    function deleteMessage(id) {
        $.ajax({
            type: "GET",
            url: "/deleteMessage/" + id,
            success: function (html) {
                window.location.reload();
            },
            error: function () {
                alert(Sorry);
            }
        });
    }

</script>
