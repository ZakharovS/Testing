<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.7.js></script>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<style>
    <%@include file="/resources/css/bootstrap.css" %>
    <%@include file="/resources/css/signin.css" %>
</style>
<t:template>
    <div id="content" align="center">
        <table align="center">
            <tr>
                <td>
                    <textarea id="question" type="text" cols="50" rows="5" placeholder="Вопрос"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea id="answer1" type="text" cols="50" placeholder="Ответ 1"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea id="answer2" type="text" cols="50" placeholder="Ответ 2"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea id="answer3" type="text" cols="50" placeholder="Ответ 3"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea id="answer4" type="text" cols="50" placeholder="Ответ 4"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan=2 align="center">
                    <br>

                    <div align="center" class="container" style="text-align: center; width: 300px;">
                        <input id="save" type="button" value="Сохранить" class="btn btn-lg btn-primary btn-block3">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan=2 align="center">
                    <br>

                    <div align="center" class="container" style="text-align: center; width: 200px;">
                        <input value="Отмена" class="btn btn-lg btn-primary btn-block3" onclick="cancel()">
                    </div>
                </td>
            </tr>
        </table>
    </div>
</t:template>

<script type="text/javascript">

    $(document).ready(function () {

        $("#save").click(function () {
            if (($("#question").val() == "") || ($("#answer1").val() == "") || ($("#answer2").val() == "")) {
                alert("Введите вопрос и по крайней мере 2 первых ответа");
            } else {
                $.ajax({
                    type: "POST",
                    url: "/saveQuestion",
                    data: {
                        question: $("#question").val(),
                        answer1: $("#answer1").val(),
                        answer2: $("#answer2").val(),
                        answer3: $("#answer3").val(),
                        answer4: $("#answer4").val()
                    },
                    success: function (html) {
                        $("#content").html(html);
                    }
                });
            }
        });

    });

    function cancel() {
        if (confirm('Точно отменить?')) {
            document.location = "/edit";
        }
    }

</script>