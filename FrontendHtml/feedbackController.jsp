<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="omadikh.Feedback" %>
<%@ page import="omadikh.FeedbackDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>


<%
    // Get the request parameters (feedback and rating)
    String comment = request.getParameter("feedback");
    String rating = request.getParameter("rating");

    

    Date date = new Date();

    FeedbackDAO feedbackDAO = new FeedbackDAO();

    // String feedbackId, String customerId, String rating, String comment, Date date
    // Must implement dynamic userId
    Feedback feedback = new Feedback("1", "1", rating, comment, date);
    
    feedbackDAO.makeFeedback(feedback);
%>