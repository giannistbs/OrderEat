<%@ page import="omadikh.MenuDAO" %>
<%@ page import="omadikh.MenuItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%
    // Create an instance of MenuDAO and retrieve the items by category
    MenuDAO menuDAO = new MenuDAO();
    List<MenuItem> breakfastItems = menuDAO.getMenuByCategory("food");
    List<MenuItem> lunchItems = menuDAO.getMenuByCategory("sweet");
    List<MenuItem> dinnerItems = menuDAO.getMenuByCategory("drink");
    
    // Handle adding/removing items from order (simulating cart behavior)
    String action = request.getParameter("action");
    Integer itemId = null;
    if (request.getParameter("id") != null) {
        itemId = Integer.parseInt(request.getParameter("id"));
    }
    // Code for adding/removing items from session order cart could go here.
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
            <div class="collapse navbar-collapse">
                <div class="navbar-nav ms-auto py-0 pe-4">
                    <a href="#" class="nav-item nav-link">Call Waiter</a>
                    <a href="menu.jsp" class="nav-item nav-link">Menu</a>
                    <a href="viewOrder.jsp" class="nav-item nav-link active">View Order</a>
                    <a href="login.jsp" class="nav-item nav-link">Login</a>
                </div>
            </div>
        </nav>
    </div>

    <!-- Menu Section -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
                <h1 class="mb-5">Choose Your Items</h1>
            </div>
            <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    <li class="nav-item"><a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1"><i class="fa fa-utensils fa-2x text-primary"></i><div class="ps-3"><h6 class="mt-n1 mb-0">Food</h6></div></a></li>
                    <li class="nav-item"><a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2"><i class="fa fa-ice-cream fa-2x text-primary"></i><div class="ps-3"><h6 class="mt-n1 mb-0">Sweet</h6></div></a></li>
                    <li class="nav-item"><a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3"><i class="fa fa-cocktail fa-2x text-primary"></i><div class="ps-3"><h6 class="mt-n1 mb-0">Drinks</h6></div></a></li>
                </ul>

                <div class="tab-content">
                    <!-- Food Tab -->
                    <div id="tab-1" class="tab-pane fade show active">
                        <div class="row g-4">
                            <%
                                for (MenuItem item : breakfastItems) {
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
                                                <form method="post" style="display: inline;">
                                                    <input type="hidden" name="action" value="remove">
                                                    <input type="hidden" name="id" value="<%= item.getItemId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary mt-1">-</button>
                                                </form>
                                                <form method="post" style="display: inline;">
                                                    <input type="hidden" name="action" value="add">
                                                    <input type="hidden" name="id" value="<%= item.getItemId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary mt-1" style="margin-left: 2px;">+</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <% 
                                }
                            %>
                        </div>
                    </div>
                    <!-- Sweet Tab -->
                    <div id="tab-2" class="tab-pane fade">
                        <div class="row g-4">
                            <%
                                for (MenuItem item : lunchItems) {
                            %>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="img/sweet/<%= item.getName().toLowerCase().replace(" ", "_") %>.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span><%= item.getName() %></span>
                                                <span class="text-primary">$<%= item.getPrice() %></span>
                                            </h5>
                                            <div class="d-flex mt-1">
                                                <small class="fst-italic align-self-center me-auto"><%= item.getDescription() %></small>
                                                <form method="post" style="display: inline;">
                                                    <input type="hidden" name="action" value="remove">
                                                    <input type="hidden" name="id" value="<%= item.getItemId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary mt-1">-</button>
                                                </form>
                                                <form method="post" style="display: inline;">
                                                    <input type="hidden" name="action" value="add">
                                                    <input type="hidden" name="id" value="<%= item.getItemId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary mt-1" style="margin-left: 2px;">+</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <% 
                                }
                            %>
                        </div>
                    </div>
                    <!-- Drinks Tab -->
                    <div id="tab-3" class="tab-pane fade">
                        <div class="row g-4">
                            <%
                                for (MenuItem item : dinnerItems) {
                            %>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="img/drink/<%= item.getName().toLowerCase().replace(" ", "_") %>.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span><%= item.getName() %></span>
                                                <span class="text-primary">$<%= item.getPrice() %></span>
                                            </h5>
                                            <div class="d-flex mt-1">
                                                <small class="fst-italic align-self-center me-auto"><%= item.getDescription() %></small>
                                                <form method="post" style="display: inline;">
                                                    <input type="hidden" name="action" value="remove">
                                                    <input type="hidden" name="id" value="<%= item.getItemId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary mt-1">-</button>
                                                </form>
                                                <form method="post" style="display: inline;">
                                                    <input type="hidden" name="action" value="add">
                                                    <input type="hidden" name="id" value="<%= item.getItemId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary mt-1" style="margin-left: 2px;">+</button>
                                                </form>
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
    </div>
</body>
</html>
