# ruby
# Модуль для добавления функционала "Издателя" в любой класс
module Observable
  def observers = @observers ||= []
  def add_observer(observer) = observers << observer
  def notify_observers = observers.each { |o| o.update(self) }
end

# Класс-Издатель
class Order
  include Observable
  attr_reader :status

  def status=(new_status)
    @status = new_status
    notify_observers
  end
end

# Класс-Наблюдатель
class CustomerNotifier
  def update(order) = puts "Уведомление: статус заказа изменён на #{order.status}"
end

# Использование
order = Order.new
order.add_observer(CustomerNotifier.new)
order.status = "отправлен"
# => "Уведомление: статус заказа изменён на отправлен"

gets # Пауза
