<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="omadikh.MenuDAO" %>
<%@ page import="omadikh.MenuItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<%
    // Create an instance of MenuDAO and retrieve the items by category
    MenuDAO menuDAO = new MenuDAO();
    List<MenuItem> breakfastItems = menuDAO.getMenuByCategory("food");
    List<MenuItem> lunchItems = menuDAO.getMenuByCategory("sweet");
    List<MenuItem> dinnerItems = menuDAO.getMenuByCategory("drink");
        
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>OrderEat</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <!-- <link href="img/favicon.ico" rel="icon"> -->

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-8">
            <a href="" class="navbar-brand p-0">
                <h1 class="text-primary m-0"><i class="fa fa-utensils me-4"></i>OrderEat</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0 pe-4">
                    <!-- <a href="index.jsp" class="nav-item nav-link">Home</a> -->
                    <!-- <a href="about.jsp" class="nav-item nav-link">Order</a> -->
                    <a href="#" class="nav-item nav-link">Call Waiter</a>
                    <a href="menu.jsp" class="nav-item nav-link active">Menu</a>
                    <a href="viewOrder.jsp" class="nav-item nav-link">View Order</a>
                    <a href="login.jsp" class="nav-item nav-link">Login</a>
                </div>
            </div>
        </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Food Menu</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item text-white active" aria-current="page">Savor the flavors of culinary excellence, where every dish tells a story and every bite is a celebration!</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
                    <h1 class="mb-5">Food</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                                <i class="fa fa-coffee fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Popular</small>
                                    <h6 class="mt-n1 mb-0">Food</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                                <i class="fa fa-hamburger fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Special</small>
                                    <h6 class="mt-n1 mb-0">Sweet</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                                <i class="fa fa-utensils fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Lovely</small>
                                    <h6 class="mt-n1 mb-0">Drinks</h6>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <!-- Breakfast Tab -->
                        <div id="tab-1" class="tab-pane fade show active">
                            <div class="row g-4">
                                <%
                                    for (MenuItem item : breakfastItems) {
                                %>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW1PsgEhJ1j03TqWMROf-aA6PCkdSUJJ2Y-w&s" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span><%= item.getName() %></span>
                                                <span class="text-primary">$<%= item.getPrice() %></span>
                                            </h5>
                                            <div class="d-flex mt-2">
                                                <small class="fst-italic align-self-center me-auto"><%= item.getDescription() %></small>
                                                <button class="btn btn-sm btn-outline-primary mt-1" onclick="removeFromOrder('<%= item.getName() %>')">-</button>
                                                <button class="btn btn-sm btn-outline-primary mt-1" onclick="addToOrder('<%= item.getName() %>')" style="margin-left: 2px;">+</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <% 
                                    }
                                %>
                            </div>
                        </div>
        
                        <!-- Lunch Tab -->
                        <div id="tab-2" class="tab-pane fade">
                            <div class="row g-4">
                                <%
                                    for (MenuItem item : lunchItems) {
                                %>
                                    <div class="col-lg-6">
                                        <div class="d-flex align-items-center">
                                            <img class="flex-shrink-0 img-fluid rounded" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW1PsgEhJ1j03TqWMROf-aA6PCkdSUJJ2Y-w&s" alt="" style="width: 80px;">
                                            <div class="w-100 d-flex flex-column text-start ps-4">
                                                <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                    <span><%= item.getName() %></span>
                                                    <span class="text-primary">$<%= item.getPrice() %></span>
                                                </h5>
                                                <div class="d-flex mt-2">
                                                    <small class="fst-italic align-self-center me-auto"><%= item.getDescription() %></small>
                                                    <button class="btn btn-sm btn-outline-primary mt-1" onclick="removeFromOrder('<%= item.getName() %>')">-</button>
                                                    <button class="btn btn-sm btn-outline-primary mt-1" onclick="addToOrder('<%= item.getName() %>')" style="margin-left: 2px;">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <% 
                                    }
                                %>
                            </div>
                        </div>
        
                        <!-- Dinner Tab -->
                        <div id="tab-3" class="tab-pane fade">
                            <div class="row g-4">
                                <%
                                    for (MenuItem item : dinnerItems) {
                                %>
                                    <div class="col-lg-6">
                                        <div class="d-flex align-items-center">
                                            <img class="flex-shrink-0 img-fluid rounded" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW1PsgEhJ1j03TqWMROf-aA6PCkdSUJJ2Y-w&s" alt="" style="width: 80px;">
                                            <div class="w-100 d-flex flex-column text-start ps-4">
                                                <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                    <span><%= item.getName() %></span>
                                                    <span class="text-primary">$<%= item.getPrice() %></span>
                                                </h5>
                                                <div class="d-flex mt-2">
                                                    <small class="fst-italic align-self-center me-auto"><%= item.getDescription() %></small>
                                                    <button class="btn btn-sm btn-outline-primary mt-1" onclick="removeFromOrder('<%= item.getName() %>')">-</button>
                                                    <button class="btn btn-sm btn-outline-primary mt-1" onclick="addToOrder('<%= item.getName() %>')" style="margin-left: 2px;">+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <% 
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Menu End -->
        </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>