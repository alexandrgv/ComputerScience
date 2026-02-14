# ruby
# Тяжёлый заказ
class Order
  def initialize(id); @id = id; @data = "Данные заказа \n#{id}"; end
  def data = @data
end

# Заместитель (Proxy)
class OrderProxy
  def initialize(id) = @id = id
  def data
    # Ленивая инициализация
    @order ||= Order.new(@id)
    @order.data
  end
end

# Использование
proxy = OrderProxy.new(1)
puts proxy.data  # загружает Order только при первом вызове data

gets # Пауза
