<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/app.jsp" >
    <c:param name="content">
    <div class="all_content bg-light pb-5">
    <div class="page_title text-center pb-4">
        <h1 class="text-info">Find the same as your issue</h1>
        <p class="text-secondary">自身が持つ課題と似たものを見つけよう</p>
        <p class="text-secondary">or<p>
        <a href="<c:url value='/questions/new' />" class="text-info"> Ask advice to solve your issue
        <span class="text-secondary">自身が持つ課題に対する解決策を尋ねてみよう</span>
        </a>
    </div>
    <div class="bg-white clearfix">
    <div class="container main_content">
        <div class="main_content_title text-center mt-2 mb-2">
        <h4 class="m-0">Issues</h4>
        <p class="text-secondary mt-0">課題一覧</p>
        </div>
        <form method="GET" action="<c:url value='/questions/searched_index' />">
        <div class="input-group justify-content-center">
            <div class="col-6">
            <input name="part_of_title" type="text" class="form-control" placeholder="ヒットしそうな文字を空白なしで入れよう" />
            </div>
            <div>
            <span class="input-group-btn">
            <button type="submit" class="btn btn-info"><i class="fas fa-search"></i></button>
            </span>
            </div>
        </div>
        </form>
        <c:forEach var="question" items="${questions}" varStatus="status">
            <div class="one_question">
                <a class="h4 text-info" href="<c:url value='/users/show?id=${question.user.id}' />">${question.user.name}</a>
                <p class="text-secondary">最終${question.updated_at}</p>
                <p class="font-weight-bold">${question.question_title}</p>
                <p class="text-truncate">${question.question_content }</p>
                <div class="content_link">
                    <a class="text-info" href="<c:url value='/questions/show?id=${question.id}' />">see details<span class="text-secondary">詳細を見る</span></a>
                </div>
            </div>
        </c:forEach>
        <c:forEach var="category" items="${categories}" varStatus="status">
            <a href="#">${category.type}</a>
        </c:forEach>
        </div>
        <div class="one_user text-center mt-2">
            <a class="h4 text-info" href="<c:url value='/users/show?id=${login_user.id}' />">${login_user.name}</a>
            <span class="text-secondary">${login_user.age}</span>
            <p>${login_user.introduction}</p>
            <form method="GET" action="<c:url value='/logout' />">
            <button class="btn btn-info">sign out</button>
            </form>
        </div>
        </div>
        <p class="font-weight-bold text-info mb-2 mt-2">全 ${questions_count} 件</p>
        <nav>
            <ul class="pagination">
            <c:forEach var="i" begin="1" end="${((questions_count - 1) / 10) + 1}" step="1">
            <c:choose>
            <c:when test="${page == i}">
            <li class="page-item active">
            <a class="page-link" href="<c:url value='/questions/index?page=${i}' />">${i}</a>
            </li>
            </c:when>
            <c:otherwise>
            <li class="page-item">
            <a class="page-link" href="<c:url value='/questions/index?page=${i}' />">${i}</a>
            </li>
            </c:otherwise>
            </c:choose>

            </c:forEach>
            </ul>
        </nav>
        </div>
    </c:param>
</c:import>