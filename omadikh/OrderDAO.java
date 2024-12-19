package omadikh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDAO {

    private static final String TABLE_NAME = "orders";
    private static final String ORDER_ITEMS_TABLE = "order_menu_items";

    public OrderDAO() {
    }

    /**
     * Places an order into the database, including its associated menu items.
     *
     * @param order The Order object to be added to the database.
     * @throws Exception if there's an issue during the operation.
     */
    public void placeOrder(Order order) throws Exception {
        DB db = new DB();
        Connection connection = null;
        PreparedStatement orderStatement = null;
        PreparedStatement itemsStatement = null;

        try {
            connection = db.getConnection();
            connection.setAutoCommit(false); // Start transaction

            // Insert the order into the "orders" table
            String insertOrderQuery = "INSERT INTO " + TABLE_NAME + " (orderId, tableId, orderDate, bill) VALUES (?, ?, ?, ?)";
            orderStatement = connection.prepareStatement(insertOrderQuery);
            orderStatement.setString(1, order.getOrderId());
            orderStatement.setString(2, order.getTableId());
            orderStatement.setDate(3, new java.sql.Date(order.getOrderDate().getTime()));
            orderStatement.setString(4, order.getBill());
            orderStatement.executeUpdate();

            // Insert associated menu items into "order_menu_items" table
            String insertItemsQuery = "INSERT INTO " + ORDER_ITEMS_TABLE + " (orderId, itemId) VALUES (?, ?)";
            itemsStatement = connection.prepareStatement(insertItemsQuery);

            for (MenuItem item : order.getMenuItems()) {
                itemsStatement.setString(1, order.getOrderId());
                itemsStatement.setInt(2, item.getItemId());
                itemsStatement.addBatch();
            }
            itemsStatement.executeBatch();

            connection.commit(); // Commit transaction
            System.out.println("Order placed successfully with Order ID: " + order.getOrderId());

        } catch (Exception e) {
            if (connection != null) connection.rollback();
            throw new Exception("Error placing order: " + e.getMessage(), e);
        } finally {
            closeResources(orderStatement, itemsStatement, connection);
        }
    }

    /**
     * Calculates the total bill for a specific order and updates it in the database.
     *
     * @param orderId The ID of the order.
     * @return The total bill amount.
     * @throws Exception if there's an issue during the operation.
     */
    public float calculateBill(String orderId) throws Exception {
        DB db = new DB();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        float totalBill = 0.0f;

        try {
            connection = db.getConnection();

            // Query to fetch the prices of all menu items for the given order
            String query = "SELECT mi.price FROM menu_items mi JOIN order_menu_items omi ON mi.itemId = omi.itemId WHERE omi.orderId = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, orderId);
            resultSet = statement.executeQuery();

            // Sum up the prices
            while (resultSet.next()) {
                totalBill += resultSet.getFloat("price");
            }

            // Update the total bill in the "orders" table
            String updateQuery = "UPDATE " + TABLE_NAME + " SET bill = ? WHERE orderId = ?";
            try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
                updateStatement.setString(1, String.format("%.2f", totalBill));
                updateStatement.setString(2, orderId);
                updateStatement.executeUpdate();
            }

            System.out.println("Total bill for Order ID " + orderId + " is $" + totalBill);

        } catch (Exception e) {
            throw new Exception("Error calculating bill: " + e.getMessage(), e);
        } finally {
            closeResources(resultSet, statement, connection);
        }

        return totalBill;
    }

    /**
     * Retrieves and lists all orders from the database.
     *
     * @return A list of Order objects.
     * @throws Exception if there's an issue during the operation.
     */
    public List<Order> manageOrders() throws Exception {
        DB db = new DB();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<Order> orders = new ArrayList<>();

        try {
            connection = db.getConnection();

            // Query to fetch all orders
            String query = "SELECT * FROM " + TABLE_NAME;
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String orderId = resultSet.getString("orderId");
                String tableId = resultSet.getString("tableId");
                Date orderDate = resultSet.getDate("orderDate");
                String bill = resultSet.getString("bill");

                orders.add(new Order(orderId, tableId, null, orderDate, bill)); // MenuItems not loaded here
                System.out.println("Order ID: " + orderId + ", Table ID: " + tableId + ", Bill: $" + bill);
            }

        } catch (Exception e) {
            throw new Exception("Error managing orders: " + e.getMessage(), e);
        } finally {
            closeResources(resultSet, statement, connection);
        }

        return orders;
    }

    // Utility method to close resources
    private void closeResources(AutoCloseable... resources) {
        for (AutoCloseable resource : resources) {
            if (resource != null) {
                try {
                    resource.close();
                } catch (Exception e) {
                    System.err.println("Error closing resource: " + e.getMessage());
                }
            }
        }
    }
}