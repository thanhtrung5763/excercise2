<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style> <%@include file="/css/styleEmailList.css" %> </style>
    <title>Midterm Excercise</title>
</head>

<body>
    <c:import url="nav.jsp"/>
<section class="p-3">
    <div class="container">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="enrollLabel">Thanks For Joining Our Email-List</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="lead">Here is the infomation that you entered</p>
                    <div class="mb-3">
                        <label class="col-form-label">First Name:</label>
                        <p type="text" class="form-control" >${user.firstname}</p>

                        <label class="col-form-label">Last Name:</label>
                        <p type="text" class="form-control" >${user.lastname}</p>

                        <label class="col-form-label">Email:</label>
                        <p type="text" class="form-control" >${user.email}</p>
                    </div>
                </div>
                <form action="" method="get">
                    <input type="hidden" name="action" value="join">
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-dark" formaction="/allEmailList" formmethod="get">Show Email List</button>
                        <button class="btn btn-danger">Return</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<c:import url="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>