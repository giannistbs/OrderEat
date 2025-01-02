<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="omadikh.MenuDAO" %>
<%@ page import="omadikh.MenuItem" %>

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

<%
    // Ensure session is not null
    List<MenuItem> orderItems = (List<MenuItem>) session.getAttribute("orderItems");
    if (orderItems == null) {
        orderItems = new ArrayList();
        session.setAttribute("orderItems", orderItems);
    }

    // Process "add" action
    String action = request.getParameter("action");
    String itemIdParam = request.getParameter("itemId");

    if ("add".equals(action) && itemIdParam != null) {
        try {
            int itemId = Integer.parseInt(itemIdParam);
            MenuDAO menuDAO = new MenuDAO();
            MenuItem item = menuDAO.getMenuItemById(itemId); // Retrieve the item from the database
            if (item != null) {
                orderItems.add(item); // Add the item to the session's cart
            }
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid item ID!</p>");
        }
    } else if ("remove".equals(action) && itemIdParam != null){
        try {
            int itemId = Integer.parseInt(itemIdParam);
            // Iterate through the orderItems list to find the item to remove
            for (MenuItem item : orderItems) {
                if (item.getItemId() == itemId) {
                    orderItems.remove(item); // Remove the item from the cart
                    break;
                }
            }
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid item ID!</p>");
        }
    }
%>

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
    

        <!-- Menu Start -->
        <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                    <% 
                        if (orderItems != null && !orderItems.isEmpty()) {
                            for (MenuItem item : orderItems) {
                    %>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center">
                            <img class="flex-shrink-0 img-fluid rounded" src="img/food/<%= item.getName().toLowerCase().replace(" ", "_") %>.jpg" alt="" style="width: 80px;">
                            <div class="w-100 d-flex flex-column text-start ps-4">
                                <h5 class="d-flex justify-content-between border-bottom pb-2">
                                    <span><%= item.getName() %></span>
                                    <span class="text-primary">$<%= item.getPrice() %></span>
                                </h5>
                                <div class="d-flex mt-1">
                                    <small class="fst-italic align-self-center me-auto"><%= item.getDescription() %></small>
                                    <!-- <button class="btn btn-sm btn-outline-primary mt-1" onclick="removeFromOrder('<%= item.getName() %>')">-</button> -->
                                    <!-- TODO -->
                                    <!-- add-to-cart & remove-from-cart to be implemented -->
                                    <button type="button" class="btn btn-sm btn-outline-primary mt-1 remove-from-cart" data-code="<%= item.getItemId() %>">-</button>
                                    <button type="button" class="btn btn-sm btn-outline-primary mt-1 add-to-cart" data-code="<%= item.getItemId() %>" style="margin-left: 2px;">+</button>
                                    <!-- <button type="button" class="btn btn-sm btn-outline-primary mt-1" onclick="addToCart(<%= item.getItemId() %>)">+</button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <% 
                            } // End of for loop
                        } else { 
                    %>
                        <div class="col-lg-12 text-center">
                            <p class="text-muted">Your cart is empty!</p>
                        </div>
                    <% 
                        } // End of if-else
                    %>
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
