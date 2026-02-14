# ruby
# Фабрика, создающая заказы и товары для разных типов магазина
# 1. Интерфейсы продуктов
class Order; end
class Product; end

# 2. Конкретные продукты семейства "Online"
class OnlineOrder < Order; end
class OfflineOrder < Order; end

# 3. Конкретные продукты семейства "Offline"
class OnlineProduct < Product; end
class OfflineProduct < Product; end

# 4. Абстрактная фабрика
class OrderFactory
  def create_order = raise(NotImplementedError)
  def create_product = raise(NotImplementedError)
end

# 5. Конкретные фабрики
class OnlineFactory < OrderFactory
  def create_order = OnlineOrder.new
  def create_product = OnlineProduct.new
end
class OfflineFactory < OrderFactory
  def create_order = OfflineOrder.new
  def create_product = OfflineProduct.new
end

# Использование:
factory = OnlineFactory.new
order   = factory.create_order   # OnlineOrder
product = factory.create_product # OnlineProduct

puts "Выбрана фабрика: #{factory.class}" # => OnlineFactory
puts "Создан заказ:    #{order.class}"   # => OnlineOrder
puts "Создан товар:    #{product.class}" # => OnlineProduct

gets # Пауза
