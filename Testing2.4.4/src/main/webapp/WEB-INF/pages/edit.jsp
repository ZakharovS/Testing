<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.7.js></script>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Редактирование</title>
    <style>
        <%@include file="/resources/css/bootstrap.css" %>
        <%@include file="/resources/css/signin.css" %>
    </style>
</head>
<body>
<t:template>
    <div id="content" align="center">
        <c:forEach items="${tests}" var="tests">
            <input type="radio" name="test" value="${tests.id}"> ${tests.name}
            <br/>
        </c:forEach>

        <br>
        <br>

        <div align="center" class="container" style="text-align: center; width: 300px;">
            <input type="button" value="Добавить вопрос" id="addquestion" class="btn btn-lg btn-primary btn-block3"
                   onclick="addQuestion()">
        </div>

        <br>
        <br>

        <form id="addTest" style="display: none">
            <textarea id="testText" cols="50" placeholder="Название теста"></textarea>
            <br>
        </form>

        <div align="center" class="container" style="text-align: center; width: 300px;">
            <input type="button" value="Добавить тест" id="addTestButton" class="btn btn-lg btn-primary btn-block3"
                   style="color: #4cae4c" onclick="disp(document.getElementById('addTest'))">
        </div>

        <br>
        <br>

        <div align="center" class="container" style="text-align: center; width: 300px;">
            <input type="button" value="Удалить тест" id="deleteTestButton" class="btn btn-lg btn-primary btn-block3"
                   style="color: #d9534f" onclick="deleteTest()">
        </div>

        <br>
        <br>

        <div align="center" class="container" style="text-align: center; width: 300px;">
            <a href="/editUsers" id="editUsers" class="btn btn-lg btn-primary btn-block3" style="color: #2556d9">Список
                пользователей</a>
        </div>

        <br>
        <br>

        <form action="/downloadVideo" enctype="multipart/form-data" method="post" class="container"
              style="text-align: center; width: 300px;">
            <input type="file" class="btn btn-lg btn-primary btn-block3"/>
            <input type="submit" value="Загрузить" class="btn btn-lg btn-primary btn-block3" style="color: #cbc9d9"/>
        </form>
        <br>
        <br>

        <div style="text-align: center; width: 200px;">
            <a class="btn btn-lg btn-primary btn-block3" onclick="history.back()">Вернуться</a>
        </div>
        <br>
    </div>
</t:template>
</body>
</html>

<script type="text/javascript">

    var testid;

    function addQuestion() {
        testid = $("input[type=radio]:checked").val();
        if (testid != null) {
            document.location = "/addQuestion/" + testid;
        } else alert("Выберите тест");

    }

    function disp(form) {
        var testValue = $("#testText").val();
        if (form.style.display == "none") {
            form.style.display = "block";
            $("#addTestButton").val("Сохранить");
        } else {
            if ((testValue == null) || (testValue == "")) {
                alert("Введите название теста")
            }
            else {
                form.style.display = "none";
                $("#addTestButton").val("Добавить тест");
                $.ajax({
                    type: "POST",
                    url: "/saveTest",
                    data: {
                        test: testValue
                    },
                    success: function (html) {
                        window.location.reload();
                    }
                });
            }
        }
    }

    function deleteTest() {
        testid = $("input[type=radio]:checked").val();
        if (testid == null) {
            alert("Выберите тест");
        } else if (confirm("Точно удалить тест?")) {
            document.location = "/deleteTest/" + testid;
        }
    }
</script>