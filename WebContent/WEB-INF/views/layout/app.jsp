<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <title>Neighbor Support App</title>
    </head>
    <body>

        <div id="wrapper">
            <div id="header">
                <nav class="navbar bg-info navbar-dark navbar-expand-xl fixed-top">
                    <a class="navbar-brand" href="#">Life question</a>
                    <button class=" btn btn-info navbar-toggler" data-toggle="collapse" data-target="#navbarExample">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <c:if test="${login_user != null}">
                    <div id="navbarExample" class="collapse navbar-collapse">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/questions/index' />">Find the same as your issue</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/questions/new' />">Ask advice to solve your issue</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/users/show?id=${login_user.id}' />">Confirm your details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/logout' />">sign out</a>
                            </li>
                        </ul>
                    </div>
                    </c:if>
                </nav>


            </div>

            <div id="content">
                ${param.content}
            </div>

            <div id="footer">

            </div>
        </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>