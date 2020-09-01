<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${errors != null}">
    <div class="mt-5">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            <c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>
<div class="container mt-5">
    <div class="card text-center border-info">
        <div class="card-header border-info">
            create or update answer form
        </div>
        <div class="card-body">
            <div class="form-group">
                <label for="answer_content"></label><br />
                <input type="text" name="answer_content" value="${answer.answer_content}"/>
                <br /><br />
            </div>
            <input type="hidden" name="_token" value="${_token}" />
            <button class="btn btn-info">投稿</button>
        </div>
    </div>
</div>