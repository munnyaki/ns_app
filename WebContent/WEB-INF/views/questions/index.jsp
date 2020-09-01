<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/app.jsp" >
    <c:param name="content">
    <div class="container">
        <h2>questions</h2>
        <c:forEach var="question" items="${questions}" varStatus="status">
        <div class="card">
            <div class="card-header">
                <h5>${question.question_title}</h5>
            </div>
            <div class="card-body">
                <div class="card-text">
                    <p>${question.question_content}</p>
                </div>
            </div>
            <div class="card-footer">
                <ol class="list-inline">
                    <li class="list-inline-item">
                        <a href="<c:url value='/users/show?id=${question.user.id}' />">
                            ${question.user.name}
                        </a>
                    </li>
                    <li class="list-inline-item">
                        投稿日時:${question.created_at}
                    </li>
                    <li class="list-inline-item">
                        最終変更日時:${question.updated_at}
                    </li>
                </ol>
            </div>
        </div>
        </c:forEach>

        <div>
            (全 ${questions_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((questions_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/questions/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        </div>
    </c:param>
</c:import>