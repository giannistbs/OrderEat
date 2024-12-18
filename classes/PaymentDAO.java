package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PaymentDAO {

    private static final String TABLE_NAME = "payments";

    public PaymentDAO() {}

    /**
     * Inserts a new payment record into the database.
     *
     * @param payment The Payment object containing payment details.
     * @throws Exception if there's an issue during the operation.
     */
    public void makePayment(Payment payment) throws Exception {
        DB db = new DB();
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = db.getConnection();

            String insertQuery = "INSERT INTO " + TABLE_NAME + " (paymentId, orderId, paymentDate, amount) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(insertQuery);
            statement.setInt(1, payment.getPaymentId());
            statement.setInt(2, payment.getOrderId());
            statement.setDate(3, new java.sql.Date(payment.getPaymentDate().getTime()));
            statement.setString(4, payment.getAmount());

            statement.executeUpdate();
            System.out.println("Payment successfully made with Payment ID: " + payment.getPaymentId());

        } catch (Exception e) {
            throw new Exception("Error inserting payment: " + e.getMessage(), e);
        } finally {
            closeResources(statement, connection);
        }
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