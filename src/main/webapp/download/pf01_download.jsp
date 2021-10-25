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
<section>
    <div class="container">
        <div class="mt-5">
            <a href="?action=viewAlbums">
                <ion-icon name="list" style="zoom:2.0;"></ion-icon>
            </a>
            <a href="?action=viewCookies" class="ps-2">
                <ion-icon name="server" style="zoom:2.0;"></ion-icon>
            </a>
            <div class="d-style bgc-white btn btn-brc-tp btn-outline-green btn-h-outline-green btn-a-outline-green w-100 my-2 py-3 shadow border-2">
                <div class="row align-items-center">
                    <div class="col-12 col-lg-4">
                        <h4 class="pt-3 text-170 text-600 text-green-d1 letter-spacing">
                            64 Corvair
                        </h4>
                        <div class="text-secondary-d1 text-120">
                            <span class="ml-n15 align-text-bottom">$</span><span class="text-180">50</span> / month
                        </div>
                    </div>

                    <ul class="list-unstyled mb-0 col-12 col-lg-4 text-dark-l1 text-90 text-left my-4 my-md-0">
                        <audio controls="" autoplay="" name="media" controlslist="nodownload">
                            <source src="<c:url value="/musicStore/mp3File/corvair.mp3"/>" type="audio/mp3">
                        </audio>
                    </ul>

                    <div class="col-12 col-lg-4 text-center">
                        <a href="<c:url value="/musicStore/mp3File/corvair.mp3"/>" target="_blank" download="star" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-75 text-600">Download</a>
                    </div>
                </div>

            </div>
            <div class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-purple btn-h-outline-purple btn-a-outline-purple w-100 my-2 py-3 shadow">
                <div class="row align-items-center">
                    <div class="col-12 col-lg-4">
                        <h4 class="pt-3 text-170 text-600 text-purple-d1 letter-spacing">
                            Whiskey Before Breakfast
                        </h4>

                        <div class="text-secondary-d1 text-120">
                            <span class="ml-n15 align-text-bottom">$</span><span class="text-180">50</span> / month
                        </div>
                    </div>

                    <ul class="list-unstyled mb-0 col-12 col-lg-4 text-dark-l1 text-90 text-left my-4 my-md-0">
                        <audio controls="" autostart="0" name="media" controlslist="nodownload">
                            <source src="<c:url value="/musicStore/mp3File/whiskey.mp3"/>" type="audio/mp3">
                        </audio>
                    </ul>

                    <div class="col-12 col-lg-4 text-center">
                        <a href="<c:url value="/musicStore/mp3File/whiskey.mp3"/>" target="_blank" download="no_difference" class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-75 text-600">Download</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>