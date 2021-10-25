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
    <style> <%@include file="/css/styleSql.css" %> </style>
    <title>Midterm Excercise</title>
</head>
<body>
<c:import url="/nav.jsp"/>
<section>
    <div class="container form-input">
        <div class="row mb-3" style="margin-top: 80px">
            <h1 class="text-center p-2">The SQL Gateway</h1>
            <div class="col-lg-8" >
                <div class="form-group">
                    <c:if test="${sqlStatement == null}">
                        <c:set var="sqlStatement" value="select * from \"user\"" />
                    </c:if>
                    <p class="text-center">Enter an SQL statement and click the Execute button.</p>
                    <p class="text-center">Remember to let the query table in double apostrophe.</p>
                    <p><b>SQL statement:</b></p>
                    <form action="${pageContext.request.contextPath}/SQLGatewayServlet" method="post">
                            <textarea class="form-control" name="sqlStatement" cols="60" rows="8">${sqlStatement}</textarea>

                        <input class="btn btn btn-success mt-2" type="submit" value="Execute">
                    </form>

                    <p><b>SQL result:</b></p>
                    <div class="table" style="width: 100%">
                        ${sqlResult}
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