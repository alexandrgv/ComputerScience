# ruby
# Стратегии (Интерфейсы расчёта)
class FixedDiscount
  def apply(order) = order.total - 5.0
end
class PercentageDiscount
  def apply(order) = order.total * 0.9
end
class NoDiscount
  def apply(order) = order.total
end

# Контекст: класс, использующий стратегию
class Order
  attr_accessor :total, :strategy

  def initialize(total, strategy = NoDiscount.new)
    @total = total
    @strategy = strategy
  end

  # Делегируем выполнение алгоритма объекту стратегии
  def final_price = strategy.apply(self)
end

# Использование
order = Order.new(100, PercentageDiscount.new)
puts order.final_price # => 90.0

# Стратегию можно подменить "на лету"
order.strategy = FixedDiscount.new
puts order.final_price # => 95.0

gets # Пауза
