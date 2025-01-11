package omadikh;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * CustomerDAO provides all the necessary methods related to Customers.
 * 
 */
public class CustomerDAO {

    private static final String TABLE_NAME = "Customers_ex3_8220146_2024_2025";

    /**
     * This method returns a List with all Customers
     * 
     * @return List<Customer>
     */
    public List<Customer> getCustomers() throws Exception {
        List<Customer> Customers = new ArrayList<>();
        DB db = new DB();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM " + TABLE_NAME;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
				String customerId = rs.getString("customerId");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
                String loyaltyPoints = rs.getString("loyaltyPoints");
				
				Customer Customer = new Customer(customerId, password, name, email, phone, loyaltyPoints);
				Customers.add(Customer);
			}
        } catch (Exception e) {
            throw new Exception("Error fetching Customers: " + e.getMessage(), e);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }

        return Customers;
    }

    /**
     * Search Customer by Customername
     * 
     * @param Customername, String
     * @return Customer, the Customer object or null
     * @throws Exception
     */
    public Customer findCustomer(String Customername) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM " + TABLE_NAME + " WHERE Customername = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Customername);
            rs = pstmt.executeQuery();

            if (rs.next()) {
				String customerId = rs.getString("customerId");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
                String loyaltyPoints = rs.getString("loyaltyPoints");
				
				Customer Customer = new Customer(customerId, password, name, email, phone, loyaltyPoints);
                return Customer;
            }
        } catch (Exception e) {
            throw new Exception("Error finding Customer: " + e.getMessage(), e);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }

        return null;
    }

    /**
     * This method is used to authenticate a Customer.
     * 
     * @param Customername, String
     * @param password, String
     * @return Customer, the Customer object
     * @throws Exception, if the credentials are not valid
     */
    public Customer authenticate(String Customername, String password) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM " + TABLE_NAME + " WHERE Customername = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Customername);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
				String customerId = rs.getString("customerId");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
                String loyaltyPoints = rs.getString("loyaltyPoints");
				
				return new Customer(customerId, password, name, email, phone, loyaltyPoints);
            } else {
                throw new Exception("Wrong Customername or password");
            }
        } catch (Exception e) {
            throw new Exception("Error during authentication: " + e.getMessage(), e);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }

    /**
     * Register/create new Customer.
     * 
     * @param Customer, Customer
     * @throws Exception, if encounter any error.
     */
    public void register(Customer Customer) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            String sqlCheck = "SELECT * FROM " + TABLE_NAME + " WHERE Customername = ? OR email = ?";
            pstmt = conn.prepareStatement(sqlCheck);
            pstmt.setString(1, Customer.getName());
            pstmt.setString(2, Customer.getEmail());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, Customername or email already registered");
            }

            String sqlInsert = "INSERT INTO " + TABLE_NAME + " (customerId, password, name, email, phone, loyaltyPoints) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, Customer.getCustomerId());
            pstmt.setString(2, Customer.getPassword());
            pstmt.setString(3, Customer.getName());
            pstmt.setString(4, Customer.getEmail());
            pstmt.setString(5, Customer.getPhone());
            pstmt.setString(6, Customer.getLoyaltyPoints());


            pstmt.executeUpdate();
        } catch (Exception e) {
            throw new Exception("Error during registration: " + e.getMessage(), e);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }

    /**
     * This method returns a Customer object based on the provided customerId.
     *
     * @param customerId, String
     * @return Customer, the Customer object or null if not found
     * @throws Exception, if any database error occurs
     */
    public Customer getCustomerById(String customerId) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM " + TABLE_NAME + " WHERE customerId = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, customerId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String password = rs.getString("password");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String loyaltyPoints = rs.getString("loyaltyPoints");

                return new Customer(customerId, password, name, email, phone, loyaltyPoints);
            }
        } catch (Exception e) {
            throw new Exception("Error fetching Customer by ID: " + e.getMessage(), e);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }

        return null;
    }


} // End of class
