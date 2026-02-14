# ruby
# 1. Старый интерфейс платежного шлюза
class OldGateway
  def send_payment(amount) = puts "Paid #{amount} via OldGateway"
end

# 2. Адаптер (новый интерфейс делает OldGateway совместимым с методом .pay)
class PaymentAdapter
  def initialize(old_gateway) = @gateway = old_gateway

  # Адаптируем интерфейс под нужды клиента
  def pay(amount) = @gateway.send_payment(amount)
end

# 3. Клиент (ожидает метод .pay)
adapter = PaymentAdapter.new(OldGateway.new)
adapter.pay(100) # => "Paid 100 via OldGateway"

gets # Пауза
