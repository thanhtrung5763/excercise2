<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 fixed-top">
    <div class="container">
        <a href="/" class="navbar-brand">Home Page</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navmenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="/emailList" class="nav-link">Email List</a>
                </li>
                <li class="nav-item">
                    <a href="/download" class="nav-link">Download</a>
                </li>
                <li class="nav-item">
                    <a href="/product" class="nav-link">Cart</a>
                </li>
                <li class="nav-item">
                    <a href="/SQLGatewayServlet" class="nav-link">SQLGateway</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
