package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MenuItemDAO {
    
    private static final String TABLE_NAME = "menu_items";

    public MenuItemDAO() {
    }

    /**
     * Updates a menu item in the database.
     * 
     * @param menuItem The MenuItem object containing the updated details.
     * @throws Exception if there's an issue during the update operation.
     */
    public void updateItems(MenuItem menuItem) throws Exception {
        DB db = new DB();
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = db.getConnection();

            // Update the menu item
            String updateQuery = "UPDATE " + TABLE_NAME + " SET name = ?, description = ?, price = ?, category = ? WHERE itemId = ?";
            statement = connection.prepareStatement(updateQuery);
            statement.setString(1, menuItem.getName());
            statement.setString(2, menuItem.getDescription());
            statement.setFloat(3, menuItem.getPrice());
            statement.setString(4, menuItem.getCategory());
            statement.setInt(5, menuItem.getItemId());

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected == 0) {
                throw new Exception("No menu item found with ID: " + menuItem.getItemId());
            }
        } catch (Exception e) {
            throw new Exception("Error updating menu item: " + e.getMessage(), e);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    // Log exception
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    // Log exception
                }
            }
        }
    }
}
