# Сущность, которую мы передаем по цепочке
Order = Struct.new(:id, :amount)

# Базовый обработчик
class Handler
  def initialize(next_handler = nil) = @next = next_handler
  def handle(order) = @next&.handle(order)
end

class Manager < Handler
  def handle(order)
    if order.amount < 1000 # заказы до 1000 usd
      puts "Менеджер одобрил заказ #{order.id}"
    else
      super
    end
  end
end

class Director < Handler
  def handle(order)
    if order.amount < 5000 # заказы до 5000 usd
      puts "Директор одобрил заказ #{order.id}"
    else
      super
    end
  end
end

class Owner < Handler
   # заказы от 5000 usd и выше
  def handle(order) = puts "Владелец одобрил заказ #{order.id}"
end

# Настройка цепочки и запуск примера
chain = Manager.new(Director.new(Owner.new))
chain.handle(Order.new(1,   500))   # Менеджер одобрил заказ 1
chain.handle(Order.new(2,  3000))   # Директор одобрил заказ 2
chain.handle(Order.new(3, 10000))   # Владелец одобрил заказ 3

gets # Пауза
