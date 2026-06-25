// java
// 3. Суть паттерна в использовании:
public class MyClass {
    public static void main(String[] args) throws Exception {
        OrderInfo view = new Order(1, "Alex", 100.50); // Объект доступен ТОЛЬКО на чтение
        System.out.println(view.getCustomerName()); // "Alex"
        // view.setTotal(200); // Ошибка
        System.in.read(); // Пауза
    }
}

// 1. Контракт на чтение (Маска)
interface OrderInfo {
    int getId();
    String getCustomerName();
    double getTotal();
}

// 2. Реализация (Данные)
class Order implements OrderInfo {
    private final int id;
    private final String customerName;
    private final double total;

    public Order(int id, String name, double total) {
        this.id = id; this.customerName = name; this.total = total;
    }
    public int getId() { return id; }
    public String getCustomerName() { return customerName; }
    public double getTotal() { return total; }
    // никаких сеттеров нет!
}
// Результат:
// Alex
