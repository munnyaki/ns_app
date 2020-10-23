<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <div>
        <div class="all_content bg-light pb-5">
        <div class="container">
        <div class="page_title text-center pb-4">
        <h1 class="text-info">Sign in</h1>
        <p class="text-secondary">まずはログインしよう</p>
        </div>
        <c:if test="${hasError}">
            <div class="alert alert-danger text-center p-0">
                <button class="close" data-dismiss="alert">&times;</button>
                <p class="font-weight-bold mb-1"> uncorrect user name or password</p>
                <p class="mb-0">ユーザー名かパスワードが間違えています</p>
            </div>
        </c:if>
        <c:if test="${flush != null}">
        <div class="alert alert-warning text-center p-0">
        <button class="close" data-dismiss="alert">&times;</button>
        <p class="font-weight-bold mb-1">${flush}</p>
        <p class="mb-0">${flush2}</p>
        </div>
        </c:if>
        <form method="POST" action="<c:url value='/login' />">
        <div class="card">
        <div class="card-body">
        <div class="question_form60 text-center">
        <div class="form-group">
        <label for="name" class="font-weight-bold mb-0">user name</label><br />
        <label for="name" class="text-secondary m-0">ユーザー名</label><br />
        <input name="name" type="text" value="${name}" class="form-control" />
        </div>
        <div class="form-group">
        <label for="password" class="font-weight-bold mb-0">user password</label><br />
        <label for="password" class="text-secondary m-0">パスワード</label><br />
        <input name="password" type="password" class="form-control" />
        </div>
        <div class="content_link2 d-flex justify-content-center">
        <button class="btn btn-info">sign in</button>
        <p class="text-secondary separate_key ml-4 mr-3">or</p>
        <a class="font-weight-bold text-info" href="<c:url value='/users/new' />">
        sign up
        <span class="text-secondary font-weight-normal">未登録の場合はまずは登録しよう</span>
        </a>
        </div>
        </div>
        </div>
        </div>
        </form>
        </div>
        </div>
        </div>
    </c:param>
</c:import>
