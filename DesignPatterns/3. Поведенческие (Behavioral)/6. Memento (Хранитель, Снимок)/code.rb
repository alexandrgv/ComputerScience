# ruby
# 1. Хранитель (Memento): хранит состояние (неизменяемый снимок)
class OrderMemento
  attr_reader :state
  def initialize(state) = @state = state
end

# 2. Создатель (Originator): создаёт снимки и восстанавливается из них
class Order
  attr_accessor :status
  def initialize = @status = 'new'
  # Создание снимка (save_state)
  def create_memento = OrderMemento.new(@status)
  # Восстановление (restore)
  def restore(memento) = @status = memento.state
end

# 3. Опекун (Caretaker): управляет историей (не знает содержимого Хранителя)
class History
  def initialize = @steps = []
  def backup(order) = @steps << order.create_memento
  def undo(order)
    return if @steps.empty?
    order.restore(@steps.pop)
  end
end

# Использование
order = Order.new
history = History.new

history.backup(order)    # сохраняем 'new'
order.status = 'shipped'
puts order.status        # => 'shipped'

history.undo(order)      # откат
puts order.status        # => 'new'

gets # Пауза
