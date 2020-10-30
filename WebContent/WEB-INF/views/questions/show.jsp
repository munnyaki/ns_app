<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp" >
    <c:param name="content">
    <c:choose>
    <c:when test="${nowquestion != null}">
        <div class="container bg-light pb-5">
            <div class="page_title text-center pb-4">
                <h1 class="text-info">Find advice to solve your issue</h1>
                <p class="text-secondary">自身が持つ課題に対する解決策を見つけよう</p>
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
            <c:if test="${flush != null}">
        <div class="alert alert-warning text-center p-0">
        <button class="close" data-dismiss="alert">&times;</button>
        <p class="font-weight-bold mb-1">${flush}</p>
        <p class="mb-0">${flush2}</p>
        </div>
        </c:if>
            <div class="bg-white clearfix">
            <div class="nav_category"><p></p></div>
            <div class="main_content">
                <div class="main_content_title text-center mt-2">
                    <h4 class="m-0">Issue</h4>
                    <p class="text-secondary mt-0">課題</p>
                </div>
                <div class="one_question">
                    <a class="h4 text-info" href="<c:url value='/users/show?id=${nowquestion.user.id}' />">${nowquestion.user.name}</a>
                    <p class="text-secondary">最終${nowquestion.updated_at}</p>
                    <p class="font-weight-bold">${nowquestion.question_title}</p>
                    <p>${nowquestion.question_content}</p>
                    <c:if test="${login_user.id == nowquestion.user.id}">
                    <div class="content_link">
                    <a class="text-info" href="<c:url value='/questions/edit?id=${nowquestion.id}' />">
                        edit your issue
                        <span class="text-secondary">自身の課題を編集する</span>
                    </a>
                    </div>
                    </c:if>
                </div>
                <div class="main_content_title text-center mt-2">
                    <h4 class="m-0">advice</h4>
                    <p class="text-secondary mt-0">提案</p>
                </div>
                <div class="page_title_2 text-center">
                    <a class="text-info" href="<c:url value='/answers/new?id=${nowquestion.id}' />">
                        Suggest advice to solve this issue
                        <span class="text-secondary">課題に対する解決策を提案する</span>
                    </a>
                </div>
                <c:forEach var="answer" items="${answers}" varStatus="status">
                    <div class="one_answer">
                        <a class="text-info h4" href="<c:url value='/users/show?id=${answer.user.id}' />">${answer.user.name}</a>
                        <p>${answer.answer_content}</p>
                        <c:if test="${login_user.id == answer.user.id}">
                            <div class="content_link">
                                <a class="text-info" href="<c:url value='/answers/edit?id=${answer.id}' />">
                                    edit your advice
                                    <span class="text-secondary">自身の提案を編集する</span>
                                </a>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
                <p class="font-weight-bold text-info mb-2 mt-2">全 ${answers_count} 件</p>
        <nav>
            <ul class="pagination">
            <c:forEach var="i" begin="1" end="${((answers_count - 1) / 10) + 1}" step="1">
            <c:choose>
            <c:when test="${page == i}">
            <li class="page-item active">
            <a class="page-link" href="<c:url value='/questions/show?id=${nowquestion.id}&page=${i}' />">${i}</a>
            </li>
            </c:when>
            <c:otherwise>
            <li class="page-item">
            <a class="page-link" href="<c:url value='/questions/show?id=${nowquestion.id}&page=${i}' />">${i}</a>
            </li>
            </c:otherwise>
            </c:choose>

            </c:forEach>
            </ul>
        </nav>
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

