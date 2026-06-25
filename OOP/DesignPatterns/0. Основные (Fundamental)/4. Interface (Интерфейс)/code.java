// java
public class MyClass {
    public static void main(String[] args) throws Exception {
        OrderRepository repo = new FileOrderRepository();
        repo.save("Laptop");
        System.out.println("Результат поиска: " + repo.find(1));
        System.in.read(); // Пауза
    }
}

interface OrderRepository {
    void save(String order);
    String find(int id);
}

class FileOrderRepository implements OrderRepository {
    public void save(String orderName) {
    	/* сохранение в файл */
  		System.out.println("Лог: Заказ '" + orderName + "' записан в файл.");
    }
    public String find(int id) {
    	/* чтение из файла */
    	return "Заказ из файла #" + id; 
    }
}
// Результат:
// Лог: Заказ 'Laptop' записан в файл.
// Результат поиска: Заказ из файла #1
