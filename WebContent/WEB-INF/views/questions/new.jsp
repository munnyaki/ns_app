<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/app.jsp" >
    <c:param name="content">
        <div class="all_content bg-light pb-5">
        <div class="page_title text-center pb-4">
            <h1 class="text-info">Ask advice to solve your issue</h1>
            <p class="text-secondary">自身が持つ課題に対する解決策を尋ねてみよう</p>
            <p class="text-secondary">or</p>
            <a class="text-info" href="<c:url value='/questions/index' />">Find the same as your issue
            <span class="text-secondary ">自身が持つ課題と似たものを見つけよう</span>
            </a>
        </div>
        <div class="bg-white clearfix">
        <div class="container main_content">
        <form method="POST" action="<c:url value='/questions/create' />">
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
                <label for="question_title" class="font-weight-bold mb-0">summary of a issue</label><br />
                <label for="question_title" class="text-secondary m-0">課題の要約</label><br />
                <textarea name="question_title" placeholder="課題の要約をつくる" class="form-control" rows="2" cols="40"></textarea><br />
                </div>
                <div class="form-group">
                <label for="question_content" class="font-weight-bold mb-0">issue</label><br />
                <label for="question_content" class="text-secondary m-0">課題</label><br />
                <textarea name="question_content" placeholder="直面している課題について整理する" class="form-control" rows="4" cols="40"></textarea>
                </div>
                <input type="hidden" name="_token" value="${_token}" />
                <button class="btn btn-info">
                Ask<br />
                尋ねてみる
                </button>
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
    </c:param>
</c:import>