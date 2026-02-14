# ruby
# Полиморфная фабрика заказов
# 1. Интерфейс продукта
class Order
  def process = "Обработка базового заказа"
end

# 2. Конкретные продукты
class OnlineOrder < Order
  def process = "Обработка онлайн-заказа"
end
class OfflineOrder < Order
  def process = "Обработка обычного заказа"
end

# 3. Базовый класс-создатель (Creator)
class OrderCreator
  # Фабричный Метод
  def create_order = raise(NotImplementedError)

  # Бизнес-логика
  def do_order
    order = create_order
    puts order.process
  end
end

# 4. Конкретные создатели
class OnlineOrderCreator < OrderCreator
  def create_order = OnlineOrder.new
end
class OfflineOrderCreator < OrderCreator
  def create_order = OfflineOrder.new
end

# Использование
creator = OnlineOrderCreator.new
creator.do_order  # => "Обработка онлайн-заказа"

gets # Пауза
