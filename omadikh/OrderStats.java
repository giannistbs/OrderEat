package omadikh;

import java.util.Map;

public class OrderStats {

    private int totalOrders;
    private double totalRevenue;
    private int totalPaidOrders;
    private int totalUnpaidOrders;
    private double averageOrderValue;
    private Map<String, Integer> ordersPerTable;

    private double foodPercentage;
    private double drinkPercentage;
    private double sweetPercentage;

    // Constructor
    public OrderStats(int totalOrders, double totalRevenue, int totalPaidOrders, int totalUnpaidOrders,
                      double averageOrderValue, Map<String, Integer> ordersPerTable,
                      double foodPercentage, double drinkPercentage, double sweetPercentage) {
        this.totalOrders = totalOrders;
        this.totalRevenue = totalRevenue;
        this.totalPaidOrders = totalPaidOrders;
        this.totalUnpaidOrders = totalUnpaidOrders;
        this.averageOrderValue = averageOrderValue;
        this.ordersPerTable = ordersPerTable;
        this.foodPercentage = foodPercentage;
        this.drinkPercentage = drinkPercentage;
        this.sweetPercentage = sweetPercentage;
    }

    // Getters
    public int getTotalOrders() {
        return totalOrders;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public int getTotalPaidOrders() {
        return totalPaidOrders;
    }

    public int getTotalUnpaidOrders() {
        return totalUnpaidOrders;
    }

    public double getAverageOrderValue() {
        return averageOrderValue;
    }

    public Map<String, Integer> getOrdersPerTable() {
        return ordersPerTable;
    }

    public double getFoodPercentage() {
        return foodPercentage;
    }

    public double getDrinkPercentage() {
        return drinkPercentage;
    }

    public double getSweetPercentage() {
        return sweetPercentage;
    }

    // toString() Method for Debugging
    @Override
    public String toString() {
        return "OrderStats{" +
                "totalOrders=" + totalOrders +
                ", totalRevenue=" + totalRevenue +
                ", totalPaidOrders=" + totalPaidOrders +
                ", totalUnpaidOrders=" + totalUnpaidOrders +
                ", averageOrderValue=" + averageOrderValue +
                ", ordersPerTable=" + ordersPerTable +
                ", foodPercentage=" + String.format("%.2f", foodPercentage * 100) + "%" +
                ", drinkPercentage=" + String.format("%.2f", drinkPercentage * 100) + "%" +
                ", sweetPercentage=" + String.format("%.2f", sweetPercentage * 100) + "%" +
                '}';
    }
}
