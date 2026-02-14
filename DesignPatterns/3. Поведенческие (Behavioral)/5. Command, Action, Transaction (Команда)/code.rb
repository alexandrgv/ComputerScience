# ruby
# Получатель: Объект, который содержит реальную бизнес-логику
class Order
  attr_reader :id
  def initialize(id) = @id = id
  def create = puts "Order #{@id} created"
  def cancel = puts "Order #{@id} canceled"
end

# Интерфейс команды (Базовый класс)
class Command
  def execute = raise NotImplementedError
end

# Конкретные команды: Связывают действие и получателя
class CreateOrder < Command
  def initialize(order) = @order = order
  def execute = @order.create
end
class CancelOrder < Command
  def initialize(order) = @order = order
  def execute = @order.cancel
end

# Использование
order = Order.new(10)
history = [CreateOrder.new(order), CancelOrder.new(order)] # Инициатор
history.each(&:execute)

gets # Пауза
