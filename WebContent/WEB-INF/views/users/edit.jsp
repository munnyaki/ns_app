<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
        <c:when test="${user != null}">
        <div>
        <div class="all_content bg-light pb-5">
            <div class="container">
                <div class="page_title text-center pb-4">
                    <h1 class="text-info">Edit your details</h1>
                    <p class="text-secondary">自身のユーザー情報を編集しよう</p>
                    <div class="page_title2 d-flex m-auto">
                        <a class="text-info" href="<c:url value='/questions/new' />">
                            Ask advice to solve your issue
                            <span class="text-secondary">自信が持つ課題に対する解決策を尋ねてみよう</span>
                        </a>
                        <p class="text-secondary separate_key">or</p>
                        <a class="text-info" href="<c:url value='/questions/index' />">
                            Find the same as your issue
                            <span class="text-secondary">自信が持つ課題と似たものを見つけよう</span>
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
                <form method="POST" action="<c:url value='/users/update' />">
                <div class="card">
                <div class="card-body">
                <div class="question_form50 text-center">
                    <div class="form-group ">
                        <label for="name" class="font-weight-bold mb-0">user name</label><br />
                        <label for="name" class="text-secondary m-0">ユーザー名</label><br />
                        <input name="name" type="text" value="${user.name}" class="form-control" />
                    </div>
                    <div class="form-group ">
                        <label for="age" class="font-weight-bold mb-0">user age</label><br />
                        <label for="age" class="text-secondary m-0">年齢</label><br />
                        <input name="age" type="text" value="${user.age}" class="form-control"/>
                    </div>
                    <div class="form-group ">
                        <label for="introduction" class="font-weight-bold mb-0">user introduction</label><br />
                        <label for="introduction" class="text-secondary m-0">ユーザー情報</label><br />
                        <textarea name="introduction" class="form-control" rows="4" cols="40">${user.introduction}</textarea>
                    </div>
                    <div class="form-group ">
                        <label for="password" class="font-weight-bold mb-0">user password</label><br />
                        <label for="password" class="text-secondary m-0">パスワード</label><br />
                        <input name="password" type="password" class="form-control"/>
                    </div>
                    <input type="hidden" name="_token" value="${_token}" />
                    <div class="content_link2 d-flex justify-content-center">
                        <button class="btn btn-info">
                        edit<br />
                        編集する
                        </button>
                        <p class="text-secondary separate_key ml-4 mr-3">or</p>
                        <a href="<c:url value='/users/show?id=${user.id}' />" class="font-weight-bold text-info">
                            cancel to edit
                            <span class="text-secondary font-weight-normal">編集をとりやめる</span>
                        </a>
                    </div>
                </div>
                </div>
                </div>
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