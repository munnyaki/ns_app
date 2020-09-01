<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp" >
    <c:param name="content">
        <div class="container">
            <h2>answers</h2>
            <c:forEach var="answer" items="${answers}" varStatus="status">
                <div class="card">
                    <div class="card-header">
                        <ol class="list-inline">
                            <li class="list-inline-item">
                                <a href="<c:url value='/users/show?id=${answer.user.id}' />">
                                    ${answer.user.name}
                                </a>
                            </li>
                            <li class="list-inline-item">
                                投稿日時:${answer.created_at}
                            </li>
                            <li class="list-inline-item">
                                最終変更日時:${answer.updated_at}
                            </li>
                        </ol>
                    </div>
                    <div class="card-body">
                        <div class="card-text">
                            <p>${answer.answer_content}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div>
            (全 ${answers_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((answers_count - 1) / 5) + 1}" step="1">
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
    </c:param>
</c:import>


