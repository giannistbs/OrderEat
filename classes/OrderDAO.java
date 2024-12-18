package classes;

import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    // Simulated database to store orders
    private List<Order> ordersDatabase = new ArrayList<>();

    // 1. Place an Order
    public void placeOrder(Order order) {
        ordersDatabase.add(order);
        System.out.println("Order placed successfully with Order ID: " + order.getOrderId());
    }

    // 2. Calculate Bill for a specific Order
    public float calculateBill(String orderId) {
        for (Order order : ordersDatabase) {
            if (order.getOrderId().equals(orderId)) {
                float total = 0;
                for (MenuItem item : order.getMenuItems()) {
                    total += item.getPrice();
                }
                order.setBill(String.format("%.2f", total));
                System.out.println("Bill for Order ID " + orderId + ": $" + total);
                return total;
            }
        }
        System.out.println("Order not found for Order ID: " + orderId);
        return 0.0f;
    }

    // 3. Manage Orders (List all Orders)
    public void manageOrders() {
        System.out.println("Listing all Orders:");
        for (Order order : ordersDatabase) {
            System.out.println(order);
        }
    }
}