<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadikh.Payment" %> 
<%@ page import="omadikh.PaymentDAO" %> 
<%@ page import="java.util.Date" %>

<%
    String totalOrd = request.getParameter("totalOrd");
    if (totalOrd == null) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("Error: Missing totalOrd parameter.");
    }

    Date date = new Date();


//    This is what the costructor is waiting 
//    int paymentId, int orderId, Date paymentDate, String amount
        int orderId = 82;
    Payment payment = new Payment(1, orderId, date, totalOrd);
%>