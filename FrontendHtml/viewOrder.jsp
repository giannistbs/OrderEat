<%@ page import="omadikh.MenuItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Simulate an order cart using session or request. This can be a list of MenuItem objects
    List<MenuItem> orderedItems = (List<MenuItem>) session.getAttribute("orderItems");
    
    // If no items are in the order cart, display a message
    if (orderedItems == null || orderedItems.isEmpty()) {
        orderedItems = new ArrayList();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>OrderEat</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar & Hero Start -->
    <div class="container-xxl position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark px-4 px-lg-5 py-3 py-lg-8">
            <a href="menu.jsp" class="navbar-brand p-0">
                <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>OrderEat</h1>
            </a>
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
                <% 
                    for (MenuItem item : orderedItems) {
                %>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center">
                            <img class="flex-shrink-0 img-fluid rounded" src="img/menu-placeholder.jpg" alt="" style="width: 80px;">
                            <div class="w-100 d-flex flex-column text-start ps-4">
                                <h5 class="d-flex justify-content-between border-bottom pb-2">
                                    <span><%= item.getName() %></span>
                                    <span class="text-primary">$<%= item.getPrice() %></span>
                                </h5>
                                <small class="fst-italic">Lorem ipsum dolor sit amet.</small>
                            </div>
                        </div>
                    </div>
                <% 
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
