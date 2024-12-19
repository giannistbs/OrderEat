package omadikh;

import java.util.Date;

public class Order {

    // Attributes
    private String orderId;
    private String tableId;
    private MenuItem[] menuItems; // Assuming MenuItem is another class
    private Date orderDate;
    private String bill;

    // Constructor
    public Order(String orderId, String tableId, MenuItem[] menuItems, Date orderDate, String bill) {
        this.orderId = orderId;
        this.tableId = tableId;
        this.menuItems = menuItems;
        this.orderDate = orderDate;
        this.bill = bill;
    }

    // Getters and Setters
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getTableId() {
        return tableId;
    }

    public void setTableId(String tableId) {
        this.tableId = tableId;
    }

    public MenuItem[] getMenuItems() {
        return menuItems;
    }

    public void setMenuItems(MenuItem[] menuItems) {
        this.menuItems = menuItems;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getBill() {
        return bill;
    }

    public void setBill(String bill) {
        this.bill = bill;
    }

    // toString method to display Order details
    @Override
    public String toString() {
        return "Order {" +
                "orderId='" + orderId + '\'' +
                ", tableId='" + tableId + '\'' +
                ", orderDate=" + orderDate +
                ", bill='" + bill + '\'' +
                '}';
    }
}