# ruby
# Класс Итератора
class StoreIterator
  def initialize(orders) = (@orders = orders; @index = 0)
  def has_next? = @index < @orders.size
  def next = @orders[@index].tap { @index += 1 }
end

# Класс Агрегата: хранит данные, но делегирует обход итератору
class Store
  def initialize(orders) = @orders = orders
  def create_iterator = StoreIterator.new(@orders)
end

# Использование
my_store = Store.new(["Заказ 1", "Заказ 2"])
iterator = my_store.create_iterator

while iterator.has_next?
  puts "Обработка: #{iterator.next}"
end

gets # Пауза
