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
            <h1 class="text-center">Midterm Excercise</h1>
        </div>
        <div class="row text-center g-4">
            <div class="col-xl">
                <div class="card bg-dark text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-envelope"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            Email List
                        </h4>
                        <p class="card-text">
                            Submit Form, Check Exist Email, Listing All Email
                        </p>
                        <a href="<c:url value ='/emailList'/>" class="btn btn-primary w-50">View</a>
                    </div>
                </div>
            </div>
            <div class="col-xl">
                <div class="card bg-secondary text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-download"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            Download CD
                        </h4>
                        <p class="card-text">
                            Show CD, Play Music, Download Albums
                        </p>
                        <a href="<c:url value ='/download'/>" class="btn btn-dark w-50">View</a>
                    </div>
                </div>
            </div>
            <div class="col-xl">
                <div class="card bg-dark text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-cart3"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            Cart
                        </h4>
                        <p class="card-text">
                            Add-Update Quantity, Delete Product From Cart
                        </p>
                        <a href="<c:url value ='/product'/>" class="btn btn-primary w-50">View</a>
                    </div>
                </div>
            </div>
            <div class="col-xl">
                <div class="card bg-secondary text-light">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-code-slash"></i>
                        </div>
                        <h4 class="card-title mb-3">
                            Sql Gateway
                        </h4>
                        <p class="card-text">
                            Take Query From Input, Execute It And See
                        </p>
                        <a href="<c:url value ='/SQLGatewayServlet'/>" class="btn btn-dark w-50">View</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>