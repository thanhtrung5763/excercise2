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
    <style> <%@include file="/css/styleDownload.css" %> </style>
    <title>Midterm Excercise</title>
</head>
<body>
<c:import url="/nav.jsp"/>
<section class="p-5">
    <div class="container">
        <c:if test="${!cookieExist}">
            <div class="mt-5 text-center">
                <a href="?action=viewAlbums">
                    <ion-icon name="list" style="zoom:2.0;"></ion-icon>
                </a>
                <a href="?action=viewCookies" class="ps-2">
                    <ion-icon name="server" style="zoom:2.0;"></ion-icon>
                </a>
            </div>
            <h3 class="text-center">All persistent cookies have been removed from this browser.</h3>
        </c:if>
        <c:if test="${cookieExist}">
        <div class="modal-dialog mw-100 w-75">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="enrollLabel">Cookie Info</h5>
                </div>
                <div class="modal-body">

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Session ID</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Email</th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                                <th scope="row">1</th>
                                <c:forEach var="c" items="${cookie}">
                                    <td>${c.value.value}</td>
                                </c:forEach>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <form action="download" method="get">
                    <input type="hidden" name="action" value="deleteCookies">
                    <div class="modal-footer">
                        <button class="btn btn-danger">Delete</button>
                    </div>
                </form>
            </div>
        </div>
        </c:if>
    </div>
</section>
<c:import url="/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>

<%--<%@page contentType="text/html" pageEncoding="utf-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">--%>
<%--    <meta http-equiv="content-language" content="vi">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">--%>
<%--    <link rel="stylesheet" href="<c:url value="/styles/styleHome.css"/>">--%>
<%--    <title>Excercise 5</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:import url="/nav.jsp"/>--%>
<%--<section class="p-5">--%>

<%--</section>--%>
<%--<c:import url="/footer.jsp"/>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>--%>
<%--</body>--%>
<%--</html>--%>