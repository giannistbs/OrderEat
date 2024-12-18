<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Orders - OrderEat</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        body {
            color: green;
        }

        /* h1 {
            margin-bottom: 30px;
            font-family: "Verdana", sans-serif;
            font-size: 1em; /* Make the title smaller */
         */

        .no-underline {
            text-decoration: none;
        }

        .table th,
        .table td {
            vertical-align: middle; /* Center-aligns the text vertically in the table cells */
        }

        .navbar {
            margin-bottom: 30px; /* Spacing for the navbar */
        }

        /* Table Color Styles */
        .table {
            background-color: #fdf1e6; /* Light background color */
        }

        .table th {
            background-color: #f9c2a5; /* Header background color */
            color: #fff; /* Header text color */
        }

        .table td {
            background-color: #fff; /* Cell background color */
        }

        /* Hover effect for table rows */
        .table tbody tr:hover {
            background-color: #ffe6cc; /* Light hover effect */
        }
    </style>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark px-4 px-lg-5 py-3 py-lg-8">
            <a href="adminview.html" class="navbar-brand">
                <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>OrderEat Admin</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0 pe-4">
                    <a href="adminview.html" class="nav-item nav-link no-underline">Dashboard</a>
                    <a href="orders.html" class="nav-item nav-link no-underline active">Orders</a>
                    <a href="reports.html" class="nav-item nav-link no-underline">Reports</a>
                    <a href="editmenu.html" class="nav-item nav-link no-underline">Edit Menu</a>
                </div>
            </div>
        </nav>

        <div class="container">
            <h1 class="text-center">Order List</h1>

            <!-- Orders Table -->
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Table</th>
                            <th>Order Date</th>
                            <th>Status</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#001</td>
                            <td>Table 2</td>
                            <td>2024-10-01</td>
                            <td>Completed</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>#002</td>
                            <td>Table 3</td>
                            <td>2024-10-02</td>
                            <td>Pending</td>
                            <td>$30.00</td>
                        </tr>
                        <tr>
                            <td>#003</td>
                            <td>Table 4</td>
                            <td>2024-10-03</td>
                            <td>Cancelled</td>
                            <td>$25.00</td>
                        </tr>
                        <tr>
                            <td>#004</td>
                            <td>Table 5</td>
                            <td>2024-10-01</td>
                            <td>Completed</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>#005</td>
                            <td>Table 6</td>
                            <td>2024-10-02</td>
                            <td>Pending</td>
                            <td>$30.00</td>
                        </tr>
                        <tr>
                            <td>#006</td>
                            <td>Table 7</td>
                            <td>2024-10-03</td>
                            <td>Cancelled</td>
                            <td>$25.00</td>
                        </tr>
                        <tr>
                            <td>#007</td>
                            <td>Table 8</td>
                            <td>2024-10-01</td>
                            <td>Completed</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>#008</td>
                            <td>Table 9</td>
                            <td>2024-10-02</td>
                            <td>Pending</td>
                            <td>$30.00</td>
                        </tr>
                        <tr>
                            <td>#009</td>
                            <td>Table 10</td>
                            <td>2024-10-03</td>
                            <td>Cancelled</td>
                            <td>$25.00</td>
                        </tr>
                        <tr>
                            <td>#010</td>
                            <td>Table 11</td>
                            <td>2024-10-01</td>
                            <td>Completed</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>#011</td>
                            <td>Table 12</td>
                            <td>2024-10-02</td>
                            <td>Pending</td>
                            <td>$30.00</td>
                        </tr>
                        <tr>
                            <td>#012</td>
                            <td>Table 13</td>
                            <td>2024-10-03</td>
                            <td>Cancelled</td>
                            <td>$25.00</td>
                        </tr>
                        <tr>
                            <td>#013</td>
                            <td>Table 14</td>
                            <td>2024-10-01</td>
                            <td>Completed</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>#014</td>
                            <td>Table 15</td>
                            <td>2024-10-02</td>
                            <td>Pending</td>
                            <td>$30.00</td>
                        </tr>
                        <tr>
                            <td>#015</td>
                            <td>Table 16</td>
                            <td>2024-10-03</td>
                            <td>Cancelled</td>
                            <td>$25.00</td>
                        </tr>
                        <tr>
                            <td>#016</td>
                            <td>Table 17</td>
                            <td>2024-10-01</td>
                            <td>Completed</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>#017</td>
                            <td>Table 18</td>
                            <td>2024-10-02</td>
                            <td>Pending</td>
                            <td>$30.00</td>
                        </tr>
                        <tr>
                            <td>#018</td>
                            <td>Table 19</td>
                            <td>2024-10-03</td>
                            <td>Cancelled</td>
                            <td>$25.00</td>
                        </tr>
                        <tr>
                            <td>#019</td>
                            <td>Table 20</td>
                            <td>2024-10-01</td>
                            <td>Completed</td>
                            <td>$45.00</td>
                        </tr>
                        <tr>
                            <td>#020</td>
                            <td>Table 21</td>
                            <td>2024-10-02</td>
                            <td>Pending</td>
                            <td>$30.00</td>
                        </tr>
                        <tr>
                            <td>#021</td>
                            <td>Table 22</td>
                            <td>2024-10-03</td>
                            <td>Cancelled</td>
                            <td>$25.00</td>
                        </tr>
                        
                        <!-- More orders can be added here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>
