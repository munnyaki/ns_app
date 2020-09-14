<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp" >
    <c:param name="content">
    <div class="bg-light">
        <div class="container">
            <div class="text-center"><br />
                <h1 class="text-info mb-0 mt-5">Sign in</h1>
                <span class="text-secondary">まずはログインしよう</span>
            </div><br />
            <div class="card text-center">
                <div class="card-body">
                    <c:if test="${hasError}">
                        <p class="mt-5">社員番号かパスワードが間違っています。</p>
                    </c:if>
                    <c:if test="${flush !=null}">
                        <c:out value="${flush}"></c:out>
                    </c:if>
                    <form method="POST" action="<c:url value='/login' />">
                        <div class="form-group"><br />
                            <label for="name" class="mb-0 h5">user name</label><br />
                            <label for ="name" class="text-secondary">ユーザー名</label> <br />
                                <div class="row justify-content-center">
                                    <div class="col-6">
                                            <input name="name" type="text" value="${name}" class="form-control" />
                                    </div>
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="mb-0 h5">user password</label><br />
                            <label for="password" class="text-secondary">パスワード</label> <br />
                                <div class="row justify-content-center">
                                    <div class="col-6">
                                        <input name="password" type="password" class="form-control" /> <br />
                                    </div>
                                </div>
                        </div>
                        <input type="hidden" name="_token" value="${_token}" />
                        <button class="btn btn-info btn-lg">sign in</button><br />or<br />
                        <a href="<c:url value='/users/new' />" class="h5">sign up</a>
                        <span class="text-secondary">未登録の場合はまずは登録しよう</span><br /><br /><br />
                    </form>
                </div>
            </div>
        </div>
    </div>
    </c:param>
</c:import>