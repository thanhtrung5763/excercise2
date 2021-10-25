<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta http-equiv="content-language" content="vi">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <style> <%@include file="/css/styleCart.css" %> </style>
    <title>Midterm Excercise</title>
</head>
<body>
<c:import url="/nav.jsp"/>
<section class="p-3">
    <div class="container">
        <div class="mt-5">
            <div class="modal-dialog mw-100 w-75">
                <div class="text-center h1">
                    Shopping
                </div>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="enrollLabel">Products</h5>

                    </div>
                    <div class="modal-body">

                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Quantity</th>
                                <th scope="col">Description</th>
                                <th scope="col">Price</th>
                                <th scope="col">Amount</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${cart.items}">
                                <tr>
                                    <td>
                                        <form action="/cart" method="post">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="productCode"
                                                   value="<c:out value='${item.product.code}'/>">
                                            <div class="input-group">
                                                <input type=text class="form-control d-inline w-50" name="quantity"
                                                       value="<c:out value='${item.quantity}'/>" id="quantity">
                                                <input type="submit" class="btn btn-outline-success" value="Update">
                                            </div>
                                        </form>
                                    </td>
                                    <td class="pt-3">
                                        <c:out value='${item.product.name}'/>a
                                    </td>
                                    <td class="pt-3">${item.product.price}$</td>
                                    <td class="pt-3">${item.totalCurrencyFormat}</td>
                                    <td>
                                        <form action="" method="post">
                                            <input type="hidden" name="productCode"
                                                   value="<c:out value='${item.product.code}'/>">
                                            <input type="hidden" name="quantity" value="0">
                                            <input type="submit" class="btn btn-outline-danger" value="Remove Item">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <form action="/product" method="get">
                        <input type="hidden" name="action" value="checkout">
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-outline-primary" value="Continue Shopping">
                            <input type="submit" class="btn btn-outline-dark" value="Checkout" formaction="/cart" formmethod="post">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
        crossorigin="anonymous"></script>
</body>
</html>


