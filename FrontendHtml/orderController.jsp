<%@ page import="java.util.*" %> 
<%@ page import="omadikh.MenuItem" %> 
<%@ page import="omadikh.Order" %> 
<%@ page import="omadikh.OrderDAO" %> 
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.util.Date" %>

<%
    List<MenuItem> orderItems = (List<MenuItem>) session.getAttribute("orderItems");
    if (orderItems == null) {
        out.println("<script>alert('Order items not found. Please add items to the cart.'); history.back();</script>");
        return;
    }

    String table = (String) session.getAttribute("table");
    if (table == null) {
        out.println("<script>alert('TableId not found'); history.back();</script>");
        return;
    }

    // Step 2: Retrieve request parameters
    String totalStr = request.getParameter("total");
    if (totalStr == null){
        out.println("<script>alert('Total items not found. Please add items to the cart.'); history.back();</script>");
        return;
    } 

    double total = 0.0;
    try {
        total = Double.parseDouble(totalStr); // Convert total to a double
    } catch (NumberFormatException e) {
        // Handle invalid total value
        out.println("<script>alert('Invalid total amount. Please try again.'); history.back();</script>");
        return;
    }

    // Convert orderDate string to Date object
    Date date = new Date();

    // Convert total to String for 'bill'
    String billStr = String.valueOf(total);

    // Create the Order object
    Order order = new Order("1", table, orderItems, date, billStr, false);

    // Place the order
    OrderDAO orderDAO = new OrderDAO();
    orderDAO.placeOrder(order);

    if (total > 0){
        orderItems.clear();
    }
    session.setAttribute("orderItems", orderItems);
%>
