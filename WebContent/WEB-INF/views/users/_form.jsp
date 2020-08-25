<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${errors != null}">
    <div class="mt-5">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            <c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>
<div class="container mt-5 ">
<div class="card text-center border-info">
<div class="card-header border-info">
    create or update user form
</div>
<div class="card-body">
<div class="form-group">
    <label for="name" class="mt-5">user's name</label><br />
    <input type="text" name="name" value="${user.name}" class="form-control" />
    <br /><br />
</div>
<div class="form-group">
    <label for="age">user's age</label><br />
    <input type="text" name="age" value="${user.age}" class="form-control" />
    <br /><br />
</div>
<div class="form-group">
    <label for="introduction">user's introduction</label><br />
    <input type="text" name="introduction" value="${user.introduction}" class="form-control"/>
    <br /><br />
</div>
<div class="form-group">
    <label for="password">user's password</label><br />
    <input type="password" name="password" class="form-control" />
    <br /><br />
</div>
<input type="hidden" name="_token" value="${_token}" />
<button class="btn btn-info">投稿</button>
</div>
</div>
</div>