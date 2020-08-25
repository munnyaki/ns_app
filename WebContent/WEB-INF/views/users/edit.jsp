<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
        <c:when test="${user != null}">
            <h1>(パスワードは変更する場合のみ入力してください)</h1>
            <form method="POST" action="<c:url value='/users/update' />">
                <c:import url="_form.jsp" />
            </form>
        </c:when>
        <c:otherwise>
            <h2 class="mt-5">お探しのユーザーは見つかりませんでした。</h2>
        </c:otherwise>
        </c:choose>
    </c:param>
</c:import>

