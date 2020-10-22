<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <div>
        <div class="all_content bg-light pb-5">
            <div class="container">
                <div class="page_title text-center pb-4">
                    <h1 class="text-info">Sign up</h1>
                    <p class="text-secondary">まずは登録しよう</p>
                </div>
                <form method="POST" action="<c:url value='/users/create' />">
                <div class="card">
                <div class="card-body">
                <div class="question_form40 text-center">
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
                        <label for="introduction" class="text-secondary m-0">ユーザー詳細</label><br />
                        <textarea name="introduction" class="form-control" rows="4" cols="40">${user.introduction}</textarea>
                    </div>
                    <div class="form-group ">
                        <label for="password" class="font-weight-bold mb-0">user password</label><br />
                        <label for="password" class="text-secondary m-0">パスワード</label><br />
                        <input name="password" type="password" class="form-control"/>
                    </div>
                    <input type="hidden" name="_token" value="${_token}" />
                    <div class="content_link2 d-flex justify-content-center">
                        <button class="btn btn-info">sign up</button>
                        <p class="text-secondary separate_key ml-4 mr-3">or</p>
                        <a class="font-weight-bold text-info" href="<c:url value='/login' />">
                            sign in
                            <span class="text-secondary font-weight-normal">登録済みの場合はログインしよう</span>
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