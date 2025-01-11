<%@ page import="java.util.List" %>
<%@ page import="omadikh.Feedback" %>
<%@ page import="omadikh.FeedbackDAO" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>OrderEat - Feedback</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <%-- Font Awesome --%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        /* Blur effect for the background */
        .blur-background {
            filter: blur(5px);
            transition: filter 0.3s ease;
        }

        .feedback-container {
            position: relative;
            z-index: 10;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .hidden {
            display: none;
        }

        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
        }

        .rating>input {
            display: none;
        }

        .rating>label {
            position: relative;
            width: 1em;
            font-size: 30px;
            font-weight: 300;
            color: #FFD600;
            cursor: pointer;
        }

        .rating>label::before {
            content: "\2605";
            position: absolute;
            opacity: 0;
        }

        .rating>label:hover:before,
        .rating>label:hover~label:before {
            opacity: 1 !important;
        }

        .rating>input:checked~label:before {
            opacity: 1;
        }

        .rating:hover>input:checked~label:before {
            opacity: 0.4;
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
        <div class="container" id="feedback-section">
            <!-- Reviews from other users -->
            <%
                // Initialize the feedback DAO and fetch the list of feedbacks
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                List<Feedback> feedbacks = feedbackDAO.viewFeedback(); // Assuming viewFeedback returns a List<Feedback>
                
                // Loop through each feedback and display dynamically
                for (Feedback feedback : feedbacks) {
            %>
                    <div class="row blur-background" id="other-reviews">
                        <div class="col-12 mb-4">
                            <h4>Feedback from other users:</h4>
                            <!-- Display feedback dynamically -->
                            <p><strong><%= feedback.getCustomerName() %></strong>: "<%= feedback.getComment() %>"</p>
                            <!-- You can also display other feedback properties, like rating -->
                            <p>Rating: <%= feedback.getRating() %> stars</p>
                        </div>
                    </div>
            <%
                }
            %>

            <!-- Feedback Form -->
            <div class="row d-flex align-items-center justify-content-center" style="margin-top: -100px;">
                <div class="col-md-6 feedback-container" id="feedback-form">
                    <h3 class="text-center mb-4 text-primary"><i class="fa fa-comment-dots me-2"></i>Feedback</h3>
                    <form>
                        <label for="name" class="form-label text-center d-block">(Name will be retrieved here)</label>
                        <div class="mb-3">
                            <label for="message" class="form-label">Your opinion is valuable to us!</label>
                            <!-- Feedback Textarea -->
                            <textarea class="form-control" id="message" rows="4" placeholder="Share your thoughts with us" required></textarea>
                        </div>
                        <!-- Star Rating Inputs -->
                        <div class="rating">
                            <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                            <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label>
                            <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                            <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                            <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                        </div>
                        <!-- Submit Button -->
                        <button type="button" class="btn btn-primary w-100 mt-4" id="submit-feedback">Submit Feedback</button>
                    </form>
                </div>
            </div>

        </div>
        <!-- Feedback Form End -->
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const submitFeedbackBtn = document.getElementById("submit-feedback");

            submitFeedbackBtn.addEventListener("click", function (e) {
                e.preventDefault(); // Prevent default button behavior

                // Get the feedback text and rating
                const feedbackText = document.getElementById("message").value;
                const starRating = document.querySelector('input[name="rating"]:checked');

                // Validate input
                if (!feedbackText) {
                    alert("Please enter your feedback.");
                    return;
                }

                if (!starRating) {
                    alert("Please select a star rating.");
                    return;
                }


                // Send data to feedbackController.jsp using AJAX
                $.ajax({
                    url: "feedbackController.jsp",  // The URL for the request
                    method: "POST",                 // The HTTP method
                    data: {
                        feedback: feedbackText,     // Send the feedback text
                        rating: starRating.value    // Send the star rating value
                    },            // Send the data as a plain string
                    success: function (response) {
                        // Hide the feedback form only if submission was successful
                        const feedbackForm = document.getElementById("feedback-form");
                        feedbackForm.style.display = "none";

                        // Remove the blur effect only after successful submission
                        const otherReviews = document.getElementById("other-reviews");
                        otherReviews.classList.remove("blur-background");
                    },
                    error: function (xhr, status, error) {
                        console.error("Error submitting feedback:", error);
                        alert("An error occurred while submitting your feedback. Please try again.");
                    }
                });
            });
        });



    </script>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
