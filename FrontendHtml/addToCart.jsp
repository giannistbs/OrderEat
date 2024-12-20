<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*, omadikh.*" %>

<%@ page errorPage="ajaxerror.jsp" %>

  

<%

String quantity = request.getParameter("quantity");

String code = request.getParameter("code");

String name = request.getParameter("name");

String price = request.getParameter("price");

String image = request.getParameter("image");

int quantityNum = 0;

double priceNum = 0;

  

try {

if (request.getHeader("X-Request-page") == null || !request.getHeader("X-Request-page").equals("my_ajax_script")) {

throw new Exception("Η σελίδα δεν επιτρέπει την απευθείας κλίση");

}

  

if (quantity == null || quantity.length() == 0

|| code == null || code.length() == 0

|| name == null || name.length() == 0

|| price == null || price.length() == 0

|| image == null || image.length() == 0) {

throw new Exception("Μη έγκυρο αίτημα");

}

  

quantityNum = Integer.parseInt(quantity);

priceNum = Double.parseDouble(price);

  

if (quantityNum <= 0) {

throw new Exception("Η ποσότητα '" + quantity + "' δεν είναι έγκυρη");

}

  

if (priceNum <= 0) {

throw new Exception("Η τιμή '" + price + "' δεν είναι έγκυρη");

}

  

} catch (Exception e) {

throw new Exception(e.getMessage());

}

  

List<MenuItem> orderItems = (List<MenuItem>) session.getAttribute("orderItems");

if (orderItems == null) {

orderItems = new ArrayList();

session.setAttribute("orderItems", orderItems);

}

  

MenuItem product = new MenuItem();

product.setId(code);

product.setName(name);

product.setPrice(priceNum);

product.setQuantity(quantityNum);

product.setImageUrl(image);

  

boolean isAlreadyInCart = false;

for (MenuItem item : orderItems) {

if (item.getId().equals(product.getId())) {

item.setQuantity(item.getQuantity() + product.getQuantity());

isAlreadyInCart = true;

break;

}

}

  

if (!isAlreadyInCart) {

orderItems.add(product);

}

  

session.setAttribute("orderItems", orderItems);

int totalItems = orderItems.stream().mapToInt(MenuItem::getQuantity).sum();

session.setAttribute("totalItems", totalItems);

  

out.print(totalItems);

%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*, omadikh.*" %>

<%@ page errorPage="ajaxerror.jsp" %>

  

<%

String quantity = request.getParameter("quantity");

String code = request.getParameter("code");

String name = request.getParameter("name");

String price = request.getParameter("price");

String image = request.getParameter("image");

int quantityNum = 0;

double priceNum = 0;

  

try {

if (request.getHeader("X-Request-page") == null || !request.getHeader("X-Request-page").equals("my_ajax_script")) {

throw new Exception("Η σελίδα δεν επιτρέπει την απευθείας κλίση");

}

  

if (quantity == null || quantity.length() == 0

|| code == null || code.length() == 0

|| name == null || name.length() == 0

|| price == null || price.length() == 0

|| image == null || image.length() == 0) {

throw new Exception("Μη έγκυρο αίτημα");

}

  

quantityNum = Integer.parseInt(quantity);

priceNum = Double.parseDouble(price);

  

if (quantityNum <= 0) {

throw new Exception("Η ποσότητα '" + quantity + "' δεν είναι έγκυρη");

}

  

if (priceNum <= 0) {

throw new Exception("Η τιμή '" + price + "' δεν είναι έγκυρη");

}

  

} catch (Exception e) {

throw new Exception(e.getMessage());

}

  

List<MenuItem> orderItems = (List<MenuItem>) session.getAttribute("orderItems");

if (orderItems == null) {

orderItems = new ArrayList<>();

session.setAttribute("orderItems", orderItems);

}

  

MenuItem product = new MenuItem();

product.setId(code);

product.setName(name);

product.setPrice(priceNum);

product.setQuantity(quantityNum);

product.setImageUrl(image);

  

boolean isAlreadyInCart = false;

for (MenuItem item : orderItems) {

if (item.getId().equals(product.getId())) {

item.setQuantity(item.getQuantity() + product.getQuantity());

isAlreadyInCart = true;

break;

}

}

  

if (!isAlreadyInCart) {

orderItems.add(product);

}

  

session.setAttribute("orderItems", orderItems);

int totalItems = orderItems.stream().mapToInt(MenuItem::getQuantity).sum();

session.setAttribute("totalItems", totalItems);

  

out.print(totalItems);

%>