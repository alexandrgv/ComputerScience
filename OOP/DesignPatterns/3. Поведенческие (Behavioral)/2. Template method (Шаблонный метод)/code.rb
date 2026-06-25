# ruby
class OrderProcessor
  # Шаблонный метод - задает скелет алгоритма
  def process
    validate
    apply_discount
    complete
  end
  def validate = puts 'Проверка заказа...'
  def apply_discount; end # хук (hook) - пустой метод для переопределения
  def complete = puts 'Заказ завершен.'
end

class OnlineOrder < OrderProcessor
  def apply_discount = puts 'Применяем онлайн-скидку.'
end

class InStoreOrder < OrderProcessor
  def apply_discount = puts 'Оффлайн-скидка не предоставляется.'
end

# Использование
OnlineOrder.new.process   # Добавит онлайн-скидку
InStoreOrder.new.process  # Скидки нет

gets # Пауза
