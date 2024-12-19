<%@ page import="omadikh.MenuItem" %>
<%
    // Retrieve the item attributes from the request
    String itemName = (String) request.getAttribute("itemName");
    Float itemPrice = (Float) request.getAttribute("itemPrice");
    
    // If itemName or itemPrice is not set, provide fallback values or handle the missing data
    if (itemName == null) {
        itemName = "Unknown Item"; // Fallback name
    }
    if (itemPrice == null) {
        itemPrice = 0.0f; // Fallback price
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>OrderEat</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

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
    <!-- Navbar & Hero Start -->
    <div class="container-xxl position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark px-4 px-lg-5 py-3 py-lg-8">
            <a href="menu.jsp" class="navbar-brand p-0">
                <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>OrderEat</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0 pe-4">
                    <a href="#" class="nav-item nav-link">Call Waiter</a>
                    <a href="menu.jsp" class="nav-item nav-link">Menu</a>
                    <a href="viewOrder.jsp" class="nav-item nav-link active">View Order</a>
                    <a href="login.jsp" class="nav-item nav-link">Login</a>
                </div>
            </div>
        </nav>
    </div>

    <!-- Order Section -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h5 class="section-title ff-secondary text-center text-primary fw-normal">Your Order</h5>
                <h1 class="mb-5">Bucket</h1>
            </div>
            <div class="row g-4">
                <!-- Display the ordered item -->
                <div class="col-lg-6">
                    <div class="d-flex align-items-center">
                        <img class="flex-shrink-0 img-fluid rounded" src="img/menu-placeholder.jpg" alt="" style="width: 80px;">
                        <div class="w-100 d-flex flex-column text-start ps-4">
                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                <span><%= itemName %></span>
                                <span class="text-primary">$<%= itemPrice %></span>
                            </h5>
                            <small class="fst-italic">Lorem ipsum dolor sit amet.</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
