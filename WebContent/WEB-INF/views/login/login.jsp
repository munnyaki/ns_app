<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp" >
    <c:param name="content">
    <form method="POST" action="<c:url value='/login' />">
        <c:if test="${hasError}">
            <p class="mt-5">社員番号かパスワードが間違っています。</p>
        </c:if>
        <c:if test="${flush !=null}">
            <c:out value="${flush}"></c:out>
        </c:if>
        <div class="container mt-5">
            <div class="card text-center border-info">
                <div class="card-header border-info">
                    sign in form
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="name">user's name</label><br />
                        <input name="name" type="text" value="${name}" class="form-control" />
                        <br /><br />
                    </div>
                    <div class="form-group">
                        <label for="password">user's password</label><br />
                        <input name="password" type="password" class="form-control" />
                        <br /><br />
                    </div>
                    <input type="hidden" name="_token" value="${_token}" />
                    <button class="btn btn-info">sign in</button>

                </div>
            </div>
        </div>
        </form>
    </c:param>
</c:import>