<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta http-equiv="content-language" content="vi">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <style> <%@include file="/css/styleHome.css" %> </style>
    <title>Midterm Excercise</title>
</head>
<body>
<c:import url="/nav.jsp"/>
<!-- Boxes -->
<section class="p-5">
    <div class="container">
        <div class="intro">
            <h2 class="text-center">Download CD</h2>
            <c:if test="${cookie.firstNameCookie.value != null}">
                <p class="text-center">Welcome back, <c:out value='${cookie.firstNameCookie.value}' default="You haven't login"/></p>
            </c:if>
        </div>
        <div class="row text-center g-4">
            <div class="col-xl">
                <div class="card bg-dark text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-disc"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            86 (the band)
                        </h4>
                        <p class="card-text">
                            True Life Songs and Pictures
                        </p>
                        <a href="<c:url value ='/download?action=checkUser&amp;productCode=8601'/>" class="btn btn-primary">View Albums</a>
                    </div>
                </div>
            </div>
            <div class="col-xl">
                <div class="card bg-secondary text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-disc"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            Paddlefoot
                        </h4>
                        <p class="card-text">
                            The First CD
                        </p>
                        <a href="<c:url value ='/download?action=checkUser&amp;productCode=pf01'/>" class="btn btn-dark">View Albums</a>
                    </div>
                </div>
            </div>
            <div class="col-xl">
                <div class="card bg-dark text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-disc"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            Paddlefoot
                        </h4>
                        <p class="card-text">
                            The Second CD
                        </p>
                        <a href="<c:url value ='/download?action=checkUser&amp;productCode=pf02'/>" class="btn btn-primary">View Albums</a>
                    </div>
                </div>
            </div>
            <div class="col-xl">
                <div class="card bg-secondary text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-disc"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            Joe Rut
                        </h4>
                        <p class="card-text">
                            Genuine Wood Grained Finish
                        </p>
                        <a href="<c:url value ='/download?action=checkUser&amp;productCode=jr01'/>" class="btn btn-primary">View Albums</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer class="bg-dark p-5 text-white text-center footer-content">
    <div class="container">
        <div class="lead">Copy &copy; 2021 Team Aslan</div>
        <a href="#" class="position-relative bottom-0 end-0 p-5"><i class="bi bi-arrow-up-circle h1"></i></a>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>