<%@ page import="omadikh.Customer, omadikh.CustomerDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        CustomerDAO customerDAO = new CustomerDAO();

        try {
            Customer customer = customerDAO.authenticate(username, password);
            if (customer != null) {
                request.getSession().setAttribute("customer", customer);
                response.sendRedirect("menu.jsp"); // Redirect to menu page after successful login
            } else {
                out.println("<p>Invalid username or password!</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>All fields are required!</p>");
    }
%>