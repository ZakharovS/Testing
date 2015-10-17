<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<script type="text/javascript" src=http://code.jquery.com/jquery-1.7.js></script>
<style>
    <%@include file="/resources/css/bootstrap.css" %>
    <%@include file="/resources/css/signin.css" %>
</style>

<t:template>
    <div id="content" align="center" class="container" style = "text-align: center; width: 300px;">
    Выбери тест:
    <br><br>

    <div style="text-align: left">
        <c:forEach items="${tests}" var="tests">
            <input id="test" type="radio" name="test" value="${tests.id}" onclick="check()"> ${tests.name}
            <br>
        </c:forEach>
    </div>
    <br>

    <input id="begtest" type="button" value="Начать тест" class="btn btn-lg btn-primary btn-block3"
           onclick="begtest()"/>

    <br>
    <br>

    <div align="center" class="container" style="text-align: center; width: 200px;">
        <a href="/userResults" id="myresults" class="btn btn-lg btn-primary btn-block3">Мои результаты</a>
    </div>

    <br>
    <br>

    <div align="center" class="container" style="text-align: center; width: 200px;">
        <a class="btn btn-lg btn-primary btn-block3" onclick="history.back()">Вернуться</a>
    </div>

</t:template>
<script type="text/javascript">

    var testid;

    function begtest() {
        testid = $("input[type=radio]:checked").val();
        if (testid != null) {
            document.location = "/test/" + testid;
        } else alert("Выберите тест");

    }


</script>