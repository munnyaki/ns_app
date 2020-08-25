<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <div class="container">
                <div class="card mt-5 text-center border-info">
                    <div class="card-header border-info">
                        user's infomation
                    </div>
                    <div class="card-body">
                        <h6 class="card-title">${user.name}(${user.age})</h6>
                        <button class="btn btn-info" data-toggle="modal" data-target="#userInfoModal">user's detail</button>
                        <div id="userInfoModal" class="modal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">user's introduction</h5>
                                        <button class="btn btn-info" data-dismiss="modal">&times;︎</button>
                                    </div>
                                    <div class="modal-body">
                                        ${user.introduction}
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-info" data-dismiss="modal">閉じる</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                </div>


            </c:when>
            <c:otherwise>
                <h2>お探しのユーザーは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>


