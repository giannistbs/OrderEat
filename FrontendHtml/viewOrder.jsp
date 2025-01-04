<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="omadikh.MenuDAO" %>
<%@ page import="omadikh.MenuItem" %>


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
            boolean itemExists = false;
            for (MenuItem existingItem : orderItems) {
                if (existingItem.getItemId() == item.getItemId()) {
                    existingItem.setQuantity(existingItem.getQuantity() + 1);
                    itemExists = true;
                    break;
                }
            }

            if (!itemExists && item != null) {
                orderItems.add(item);
                item.setQuantity(1);
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
                    if (item.getQuantity() == 1){
                        orderItems.remove(item); // Remove the item from the cart
                        break;
                    } else {
                        item.setQuantity(item.getQuantity() - 1);
                    }
                }
            }
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid item ID!</p>");
        }
    } else if ("clear".equals(action)) {
        orderItems.clear(); // Clear all items from the cart
        session.setAttribute("orderItems", orderItems);
    }
    

    if (action != null && !"clear".equals(action)) {
        request.setAttribute("orderItems", orderItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
        dispatcher.forward(request, response);
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
    <style>
       .order-summary {
            position: fixed; /* Ensures it sticks to the viewport */
            bottom: -500px; /* Places it at the bottom */
            width: 87%; /* Full width */
            background-color: #fff0d5;
            padding: 15px;
            text-align: center;
            z-index: 1000; /* Ensures it stays on top */
            border-radius: 10px;
            height: 105px;
            display: flex;
            flex-direction: column;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);  /* Adds depth if needed */
        }
        .order-summary p {
            margin: 0;
            font-size: 16px;
        }

        .order-summary {
            transition: transform 0.6s;
            transform-style: preserve-3d;
            position: relative;
        }

        .order-summary.flipped {
            transform: rotateY(180deg);
        }

        .order-summary .front,
        .order-summary .back {
            backface-visibility: hidden;
            position: fixed;
            width: 87%;
        }
        
        .order-summary .back {
            transform: rotateY(180deg);
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
        }

        .hidden {
            display: none;
        }

       
    </style>
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
    

        <!-- Menu Start -->
        <div class="container menu-section mt-3">
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
                                                <div style="display: flex; align-items: center;">
                                                    <span><%= item.getName() %></span>
                                                    <h3 class="text-primary m-0" style="margin-left: 2px; font-size: 1rem;"><i class="fa me-1"></i>x<%= item.getQuantity() %></h3>
                                                </div>
                                                
                                                <span class="text-primary">$<%= item.getPrice() * item.getQuantity() %></span>
                                            </h5>
                                            <div class="d-flex mt-1">
                                                <small class="fst-italic align-self-center me-auto"><%= item.getDescription() %></small>
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
                    
                    <div class="order-summary" id="orderSummary" style="position: fixed; bottom: 20px; right: 20px; background-color: white; padding: 15px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1); font-size: 0.9rem; width: 250px;">
                        <% 
                            double total = 0;
                            for (MenuItem item : orderItems) {
                                total += item.getPrice() * item.getQuantity();
                            }
                        %>
                        <!-- Front Section -->
                        <div class="front" style="bottom: 4px;">
                            <!-- Total Section -->
                            <p class="total mb-3 fw-bold text-center" style="font-size: 0.8rem;">Total: <strong>$<%= String.format("%.2f", total) %></strong></p>
                            
                            <!-- Button Group -->
                            <div class="d-flex justify-content-between">
                                <button id="placeOrderBtn" class="btn btn-primary btn-sm me-2" style="width: 45%; font-size: 0.8rem;">Place Order</button>
                                <form method="post" action="viewOrder.jsp" style="display: contents;">
                                    <input type="hidden" name="action" value="clear">
                                    <button class="btn btn-light btn-sm ms-2" style="width: 45%; font-size: 0.8rem;" aria-label="Clear Order">
                                        <i class="fa fa-trash" style="font-size: 1.5rem; color: rgb(124, 124, 124);"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    
                        <!-- Back Section -->
                        <div class="back hidden d-flex justify-content-between">
                            <p class="total mb-3 fw-bold text-center" style="font-size: 0.8rem;">Total: <strong>$<%= String.format("%.2f", total) %></strong></p>
                            <div class="d-flex justify-content-between" style="bottom: 0px">
                                <button class="btn btn-primary btn-sm me-2" style="width: 45%; font-size: 0.8rem;">Pay</button>
                                <button class="btn btn-primary btn-sm me-2" style="width: 45%; font-size: 0.8rem; text-align: left; padding-left: 7px;">Feedback</button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

    <script>
        // Ensure the DOM is fully loaded before accessing elements
        document.addEventListener("DOMContentLoaded", function () {
            const placeOrderBtn = document.getElementById("placeOrderBtn");
            const orderSummary = document.getElementById("orderSummary");
            const backContent = orderSummary.querySelector(".back");
            const frontButtons = orderSummary.querySelectorAll(".front .btn");
    
            // Check if the div has already flipped in this session
            if (sessionStorage.getItem("orderSummaryFlipped") === "true") {
                orderSummary.classList.add("flipped");
                backContent.classList.remove("hidden");
                frontButtons.forEach(button => button.classList.add("hidden"));
            }

            placeOrderBtn.addEventListener("click", function () {
                // Add the "flipped" class to trigger the animation
                orderSummary.classList.add("flipped");
    
                // Show the back content after the animation
                setTimeout(() => {
                    backContent.classList.remove("hidden"); // Show the back content
                    frontButtons.forEach(button => button.classList.add("hidden"));
                }, 600); // Match the duration of the flip animation

                sessionStorage.setItem("orderSummaryFlipped", "true");
            });
        });
        document.addEventListener("DOMContentLoaded", function () {
            const placeButton = document.getElementById("placeOrderBtn");

            placeButton.addEventListener("click", function () {
                // Prepare the order data
                const total = String("<%=total%>");

                // Send AJAX request
                $.ajax({
                    url: "orderController.jsp", // The servlet URL
                    type: "POST",
                    data: {
                        total: total,   // Total price
                    },
                    success: function (response) {
                        // Handle successful response
                        alert("Order placed successfully!");
                    },
                    error: function (xhr, status, error) {
                        // Handle error
                        console.error("Error:", error);
                        alert("Failed to place the order. Please try again." + xhr.status);
                        console.error("Status Code:", xhr.status);
                    },
                });
            });
        });

        document.addEventListener("DOMContentLoaded", function () {
        const clearOrderBtn = document.querySelector('form[action="viewOrder.jsp"] button[type="submit"]');

        clearOrderBtn.addEventListener("click", function (e) {
            e.preventDefault(); // Prevent form submission
            fetch('viewOrder.jsp?action=clear', { method: 'POST' })
                .then(response => response.text())
                .then(data => {
                    // Optionally, clear the cart visually
                    const orderSummary = document.getElementById("orderSummary");
                    location.reload()
                    orderSummary.innerHTML = `
                        <p class="text-muted text-center">Your cart is empty!</p>
                    `;
                })
                .catch(error => console.error('Error:', error));
        });
    });
    </script>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
