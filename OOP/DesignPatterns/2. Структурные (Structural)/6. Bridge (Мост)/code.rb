# ruby
# Реализация (Implementation) - "внутренняя кухня"
class StripeGateway
  def transfer(amount) = puts "Stripe: процессинг #{amount}$"
end
class PaypalGateway
  def transfer(amount) = puts "PayPal: перевод #{amount}$"
end

# Абстракция (Abstraction) - "пульт управления"
class PaymentProcessor
  def initialize(gateway) = @gateway = gateway
  # Мост: вызываем метод реализации внутри метода абстракции
  def pay(amount) = @gateway.transfer(amount)
end

# Уточненная Абстракция (Refined Abstraction)
# Показывает, зачем нужен Bridge: мы можем менять логику, не трогая шлюзы
class RefundableProcessor < PaymentProcessor
  def refund(amount) = puts "Возврат через #{@gateway.class}: #{amount}$"
end

# Использование
stripe_payment = PaymentProcessor.new(StripeGateway.new)
stripe_payment.pay(100) # => Stripe: процессинг 100$

paypal_refund = RefundableProcessor.new(PaypalGateway.new)
paypal_refund.refund(50) # => Возврат через PaypalGateway: 50$

gets # Пауза
