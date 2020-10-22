<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/app.jsp" >
    <c:param name="content">
    <c:choose>
    <c:when test="${nowquestion != null}">
        <div class="all_content bg-light pb-5">
            <div class="page_title text-center pb-4">
                <h2 class="text-info">Suggest advice to solve someones issue</h2>
                <p class="text-secondary">誰かが抱える課題に対する解決策を提案しよう</p>
                <div class="page_title2 d-flex m-auto">
                    <a class="text-info" href="<c:url value='/questions/new' />">
                        Ask advice to solve your issue
                        <span class="text-secondary">自身が持つ課題に対する解決策を尋ねてみよう</span>
                    </a>
                    <p class="text-secondary separate_key">or</p>
                    <a class="text-info" href="<c:url value='/questions/index' />">
                        Find the same as your issue
                        <span class="text-secondary">自身が持つ課題と似ているものを見つけよう</span>
                    </a>
                </div>
            </div>
            <div class="bg-white clearfix">
            <div class="container main_content">
                <form method="POST" action="<c:url value='/answers/create?id=${nowquestion.id}' />">
                <div class="main_content_title text-center mt-2">
                    <h4 class="m-0">Issue</h4>
                    <p class="text-secondary mt-0">課題</p>
                </div>
                <div class="one_question">
                    <a href="<c:url value='/users/show?id=${nowquestion.user.id}' />" class="h4 text-info">${nowquestion.user.name}</a>
                    <p class="text-secondary">最終${nowquestion.updated_at}</p>
                    <p class="font-weight-bold">${nowquestion.question_title}</p>
                    <p class="">${nowquestion.question_content}</p>
                </div>
                <div class="text-center mt-2">
                    <h4 class="m-0">advice</h4>
                    <p class="text-secondary mt-0">提案</p>
                </div>
                <div class="summary text-info mb-3">
                    <h4>案内</h4>
                    <p class="m-0">
                    ただ方法を書き連ねるのではなく何を目指してやるのかなぜそうなるのか納得してもらえるように論理的に書いてみよう
                    </p>
                </div>
                <div class="answer_form30 text-center">
                    <a class="h4 text-info" href="<c:url value='/users/show?id=${login_user.id}' />">${login_user.name}</a>
                    <div class="form-group">
                        <label for="answer_content" class="font-weight-bold mb-0">advice</label><br />
                        <label for="answer_content" class="text-secondary m-0">提案</label><br />
                        <textarea name="answer_content" placeholder="課題に対する解決策を提案する" class="form-control" rows="4" cols="40"></textarea>
                    </div>
                    <input type="hidden" name="_token" value="${_token}" />

                    <div class="content_link2 d-flex justify-content-center">
                        <button class="btn btn-info">
                        suggest<br />
                        提案する
                        </button>
                        <p class="text-secondary separate_key ml-4 mr-3">or</p>
                        <a class="font-weight-bold text-info" href="<c:url value='/questions/show?id=${nowquestion.id}' />">
                        cancel to suggest
                        <span class="text-secondary font-weight-normal">提案をとりやめる</span>
                        </a>
                    </div>
                </div>
                </form>
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
                <h1 class="text-info">404 Not found issue</h1>
                <p class="text-secondary">お探しの課題は見つかりませんでした</p>
                </div>
        </c:otherwise>
        </c:choose>
    </c:param>
</c:import>