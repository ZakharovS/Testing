<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<style>
    <%@include file="/resources/css/bootstrap.css" %>
    <%@include file="/resources/css/signin.css" %>
</style>
<script type="text/javascript" src="/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/role.js"></script>
<script type="text/javascript" src="/resources/js/userEdit.js"></script>
<t:template>
    <div id="content" class="container" style="width: 400px;">
        <c:forEach items="${users}" var="allUsersList">

            <div id="userName" class="editUsers">${allUsersList.userName}</div>
            <div id="userDetails" class="editUsersPlus">
                <input id="nickName" value=${allUsersList.nickName}/>
                <input id="eMail" value=${allUsersList.eMail}/>
                <input id="password" value=${allUsersList.password}/>
                <select id="role">
                    <option id="admin" class="admin">Администратор</option>
                    <option id="user" class="user">Пользователь</option>
                </select>
                <script type="text/javascript">
                    changeAttribute("${allUsersList.authorization.userrole}");
                </script>
                <br/>
                <a class="btn btn-lg btn-primary btn-block3" style="margin: auto; width: 150px">Сохранить</a>
            </div>

        </c:forEach>

        <br>
        <br>

        <div>
            <a class="btn btn-lg btn-primary btn-block3" style="margin: auto; width: 300px" onclick="history.back()">Сохранить
                все</a>
        </div>
        <br>

        <div>
            <a class="btn btn-lg btn-primary btn-block3" style="margin: auto; width: 200px" onclick="history.back()">Вернуться</a>
        </div>
        </td>
    </div>
</t:template>