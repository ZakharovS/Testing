<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="content" align="center">
    Выбери правильный ответ для своего вопроса:
    <br>
    <c:forEach items="${answers}" var="answers">
        <input type="radio" name="answers" value="${answers.id}">${answers.answer}
        <br>
    </c:forEach>
    <br>
    <input type="button" value="Сохранить" id="savecorrect" class="btn btn-lg btn-primary btn-block3"
           style="width: 300px" onclick="saveCorrect()">
</div>
<br>

<div align="center" class="container" style="text-align: center; width: 200px;">
    <input value="Отмена" class="btn btn-lg btn-primary btn-block3" onclick="cancel()">
</div>

<script>

    var correct;

    function saveCorrect() {
        correct = $("input[type=radio]:checked").val();
        if (correct != null) {
            document.location = "/saveCorrect/" + correct;
        } else alert("Выберите правильный ответ");
    }

    function cancel() {
        if (confirm('Точно отменить?')) {
            $.ajax({
                type: "GET",
                url: "/cancel",
                success: function (html) {
                    document.location = "/edit";
                }
            });
        }
    }

</script>