<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadikh.Payment" %> 
<%@ page import="omadikh.PaymentDAO" %> 
<%@ page import="omadikh.OrderDAO" %> 
<%@ page import="omadikh.Order" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%

    String tableId = (String) session.getAttribute("table");

    // String totalOrd = request.getParameter("totalOrd");
    // if (totalOrd == null) {
    //     response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    //     response.getWriter().write("Error: Missing totalOrd parameter.");
    // }

    Date date = new Date();


//    This is what the costructor is waiting 
//    int paymentId, int orderId, Date paymentDate, String amount

    List<Order> orders = new ArrayList();

    OrderDAO orderDAO = new OrderDAO();
    PaymentDAO paymentDAO = new PaymentDAO();

    orders = orderDAO.retrieveOrdersByTable(tableId);

    
    for (Order order : orders){
        int orderId = Integer.parseInt(order.getOrderId());
        String bill = order.getBill();
        Payment payment = new Payment(1, orderId, date, bill);
        paymentDAO.makePayment(payment);
    }
%>