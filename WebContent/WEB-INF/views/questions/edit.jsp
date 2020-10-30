<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${question != null}" >
                <div class="container bg-light pb-5">
        <div class="page_title text-center pb-4">
            <h1 class="text-info">Edit your issue</h1>
            <p class="text-secondary">自身の課題を編集しよう</p>
                <div class="page_title2">
                <a class="text-info" href="<c:url value='/questions/new' />">Ask advice to solve your issue
                    <span class="text-secondary">自身が持つ課題に対する解決策を尋ねてみよう</span>
                </a>
                <p class="text-secondary separate_key">or</p>
                <a class="text-info" href="<c:url value='/questions/index' />">Find the same as your issue
                    <span class="text-secondary ">自身が持つ課題と似たものを見つけよう</span>
                </a>
                </div>
        </div>
        <c:if test="${errors != null}">
            <div class="alert alert-danger text-center p-0">
            <button class="close" data-dismiss="alert">&times;</button>
            <p class="font-weight-bold mb-1">入力内容にエラーがあります</p>
            <c:forEach var="error" items="${errors}">
            <p class="mb-0">${error}</p>
            </c:forEach>
            </div>
        </c:if>
        <div class="bg-white clearfix">
        <div class="nav_category"><p></p></div>
        <div class="main_content">
        <form method="POST" action="<c:url value='/questions/update' />">
            <div class="text-center mt-2">
                <h4 class="m-0">Issue</h4>
                <p class="text-secondary mt-0">課題</p>
            </div>
            <div class="summary text-info mb-3">
                <h4>案内</h4>
                <p class="font-weight-bold mb-0">summary of a issue</p>
                <p class="m-0">うまくいかないこと思い通りにならないこと変えたいことどうにかしたいと思っていることを捻り出して書いてみよう</p>
                <p class="font-weight-bold mb-0">issue</p>
                <p class="m-0">どんな場面でのことなのかを詳細に書き出してみよう</p>
            </div>
            <div class="question_form10 text-center">
                <div class="form-group mb-0">
                    <label for="category" class="font-weight-bold mb-0">category</label><br />
                    <label for="category" class="text-secondary m-0">カテゴリー</label><br />
                <div class="row justify-content-center">
                    <select name="category" class="form-control col-3 font-weight-bold text-info">
                        <option>Issue on (必須)</option>
                        <c:forEach var="category" items="${categories}" varStatus="status">
                        <option value="${category.id}">${category.type}</option>
                        </c:forEach>
                    </select><br />
                </div>

                </div>
                <div class="form-group mb-0">
                <label for="question_title" class="font-weight-bold mb-0">summary of a issue</label><br />
                <label for="question_title" class="text-secondary m-0">課題の要約</label><br />
                <textarea name="question_title" placeholder="課題の要約をつくる" class="form-control" rows="2" cols="40">${question.question_title}</textarea><br />
                </div>
                <div class="form-group">
                <label for="question_content" class="font-weight-bold mb-0">issue</label><br />
                <label for="question_content" class="text-secondary m-0">課題</label><br />
                <textarea name="question_content" placeholder="直面している課題について整理する" class="form-control" rows="4" cols="40">${question.question_content}</textarea>
                </div>
                <input type="hidden" name="_token" value="${_token}" />
                <div class="content_link2 d-flex justify-content-center">
                <button class="btn btn-info">
                edit<br />
                編集する
                </button>
                <p class="text-secondary separate_key ml-4 mr-3">or</p>
                <a class="font-weight-bold text-info" href="<c:url value='/questions/show?id=${question.id}' />">
                cancel to edit
                <span class="text-secondary font-weight-normal">編集をとりやめる</span>
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