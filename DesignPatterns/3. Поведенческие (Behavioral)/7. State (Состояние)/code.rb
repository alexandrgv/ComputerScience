# ruby
# Контекст
class Order
  attr_accessor :state

  def initialize = @state = Pending.new
  def process = @state.process(self)
end

# Состояния
class Pending
  def process(order) = (puts "Ожидание: упаковываем заказ"; order.state = Shipped.new)
end
class Shipped
  def process(order) = (puts "Отправлено: заказ в пути"; order.state = Delivered.new)
end
class Delivered
  def process(order) = puts "Доставлено: заказ завершен"
end

# Использование
order = Order.new
order.process  # Ожидание -> Отправлено
order.process  # Отправлено -> Доставлено
order.process  # Доставлено

gets # Пауза
