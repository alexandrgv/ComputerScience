// java
// 3. Использование (проверка метки)
public class Main {
    public static void main(String[] args) throws Exception {
        Object obj = new Product();

        if (obj instanceof Exportable) {
            System.out.println("Объект готов к экспорту");
        } else {
            System.out.println("Экспорт запрещен: нет метки Exportable");
        }
        System.in.read(); // Пауза
    }
}

// 1. Интерфейс-маркер (без методов)
public interface Exportable {}

// 2. Класс, помеченный маркером (как экспортируемый)
class Product implements Exportable {
    public int id; // ...
}
// Результат:
// Объект готов к экспорту
