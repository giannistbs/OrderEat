<%@ page import="java.util.HashMap" %>
<%
    // Retrieve the HashMap from the session
    HashMap<Integer, Integer> itemQuantities = 
        (HashMap<Integer, Integer>) session.getAttribute("itemQuantities");

    if (itemQuantities == null || itemQuantities.isEmpty()) {
%>
    <p>Your order is empty!</p>
<%
    } else {
%>
    <h3>Your Order</h3>
    <ul>
        <%
            for (Integer itemId : itemQuantities.keySet()) {
                int quantity = itemQuantities.get(itemId);
        %>
        <li>Item ID: <%= itemId %> - Quantity: <%= quantity %></li>
        <%
            }
        %>
    </ul>
<%
    }
%>
