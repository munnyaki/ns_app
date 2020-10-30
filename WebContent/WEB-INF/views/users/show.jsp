<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <div class="container bg-light pb-5">
                <div class="page_title text-center pb-4">
                <h1 class="text-info">Confirm your details</h1>
                <p class="text-secondary">自身のユーザー情報を確かめよう</p>
                <div class="page_title2">
                    <a class="text-info" href="<c:url value='/questions/new' />">
                        Ask advice to solve your issue
                        <span class="text-secondary">自身が持つ課題に対する解決策を尋ねてみよう</span>
                    </a>
                    <p class="text-secondary separate_key">or</p>
                    <a class="text-info" href="<c:url value='/questions/index' />">
                        Find the same as your issue
                        <span class="text-secondary">自身が持つ課題と似たものを見つけよう</span>
                    </a>
                </div>
                </div>
                <div class="bg-white clearfix">
                <div class="nav_category"><p></p></div>
                <div class="main_content">
                <div class="main_content_title text-center mt-2">
                <h4 class="m-0">your details</h4>
                <p class="text-secondary mt-0">ユーザー情報</p>
                </div>
                <div class="someone_user70 text-center">
                <p class="h4 text-info">${user.name}</p>
                <p class="text-secondary">${user.age}</p>
                <p>${user.introduction}</p>
                </div>
                <c:if test="${login_user.id == user.id}">
                <div class="page_title70_2 text-center">
                <a class="text-info" href="<c:url value='/users/edit?id=${login_user.id}' />">
                Edit your details
                <span class="text-secondary">ユーザー情報を編集する</span>
                </a>
                </div>
                </c:if>
                <div class="main_content_title text-center mt-2">
                <h4 class="m-0">your issue</h4>
                <p class="text-secondary mt-0">課題</p>
                </div>
                <c:forEach var="question" items="${questions}" varStatus="status">
                <div class="one_question">
                <p class="text-secondary">最終${question.updated_at}</p>
                <p class="font-weight-bold">${question.question_title}</p>
                <p class="text-truncate">${question.question_content }</p>
                <div class="content_link">
                    <a class="text-info" href="<c:url value='/questions/show?id=${question.id}' />">see details<span class="text-secondary">詳細を見る</span></a>
                </div>
                </div>
                </c:forEach>
                <div class="main_content_title text-center mt-2">
                <h4 class="m-0">your advice</h4>
                <p class="text-secondary mt-0">提案</p>
                </div>
                <c:forEach var="answer" items="${answers}" varStatus="status">
                    <div class="one_answer">
                        <p class="text-info h4">${answer.question.user.name}</p>
                        <p class="font-weight-bold">${answer.question.question_title}</p>
                        <p class="text-truncate">${answer.answer_content}</p>

                            <div class="content_link">
                                <a class="text-info" href="<c:url value='/questions/show?id=${answer.question.id}' />">
                                    see details
                                    <span class="text-secondary">詳細を見る</span>
                                </a>
                            </div>

                    </div>
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
                </div>



            </c:when>
            <c:otherwise>
                <div class="page_title text-center">
                <h1 class="text-info">404 Not found user</h1>
                <p class="text-secondary">お探しのユーザーは見つかりませんでした</p>
                </div>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>


