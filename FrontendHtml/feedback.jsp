<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>OrderEat - Feedback</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

    <%-- Font Awesome --%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .rating {
        display: flex;
        flex-direction: row-reverse;
        justify-content: center
        }

        .rating>input {
            display: none
        }

        .rating>label {
            position: relative;
            width: 1em;
            font-size: 30px;
            font-weight: 300;
            color: #FFD600;
            cursor: pointer
        }

        .rating>label::before {
            content: "\2605";
            position: absolute;
            opacity: 0
        }

        .rating>label:hover:before,
        .rating>label:hover~label:before {
            opacity: 1 !important
        }

        .rating>input:checked~label:before {
            opacity: 1
        }

        .rating:hover>input:checked~label:before {
            opacity: 0.4
        }


        .buttons{
            top: 36px;
            position: relative;
        }


        .rating-submit{
            border-radius: 15px;
            color: #fff;
                height: 49px;
        }


        .rating-submit:hover{
            
            color: #fff;
        }
    </style>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Navbar Start -->
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
                    <a href="viewOrder.jsp" class="nav-item nav-link">View Order</a>
                    <a href="login.jsp" class="nav-item nav-link">
                        <i class="fa-solid fa-user"></i> Login
                    </a>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- Feedback Form Start -->
        <div class="container d-flex align-items-center justify-content-center" style="min-height: 100vh; padding-top: 80px;">
            <div class="col-md-6 col-lg-5 col-xl-4">
                <div class="card shadow-sm border-0">
                    <div class="card-body p-4">
                        <h3 class="text-center mb-4 text-primary"><i class="fa fa-comment-dots me-2"></i>Feedback</h3>
                        <form>
                            <label for="name" class="form-label text-center d-block">(Name will be retrieved here)</label>
                            <div class="mb-3">
                                <label for="message" class="form-label">Tell us your opinion!</label>
                                <textarea class="form-control" id="message" rows="4" placeholder="Share your thoughts with us" required></textarea>
                            </div>
                            <div class="d-flex justify-content-between align-items-center"></div>
                            <div class="rating"> <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label></div>
                            <button type="submit" class="btn btn-primary w-100 mt-4">Submit Feedback</button>
                        </form>
                        <p class="text-center mt-3 mb-0">Go back to <a href="menu.jsp" class="text-primary">Menu</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Feedback Form End -->

    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>