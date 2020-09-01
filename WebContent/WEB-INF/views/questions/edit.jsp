<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${question != null}" >
                <form method="POST" action="<c:url value='/questions/update' />">
                    <c:import url="_form.jsp" />
                </form>
            </c:when>
            <c:otherwise>
                <h2 class="mt-5">お探しの質問は見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>