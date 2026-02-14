# ruby
class Order
  attr_accessor :items, :client, :delivery
  def initialize = @items = []
end

# Строитель класса Order
class OrderBuilder
  def initialize = @order = Order.new
  # Каждый метод настройки возвращает self
  def add_item(name, price) = (@order.items << { name: name, price: price }; self)
  def set_client(name) = (@order.client = name; self)
  def set_delivery(type) = (@order.delivery = type; self)
  # Финальный метод, возвращающий готовый объект
  def build = @order
end

# Использование через цепочку вызовов:
order = OrderBuilder.new
                    .set_client("Иван")
                    .add_item("Кофе", 300)
                    .add_item("Печенье", 150)
                    .set_delivery("Курьер")
                    .build
pp order

gets # Пауза
