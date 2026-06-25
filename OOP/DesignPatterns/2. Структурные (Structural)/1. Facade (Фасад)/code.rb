# ruby
# Сложные подсистемы
class Inventory;    def check = "Stock OK"; end
class Billing;      def charge = "Paid";    end
class Notification; def send = "Sent";      end

# Фасад скрывает комплекс вызовов системных компонентов за одним методом place_order
class ShopFacade
  def initialize
    @inventory = Inventory.new
    @billing = Billing.new
    @notify = Notification.new
  end

  def place_order
    @inventory.check
    @billing.charge
    @notify.send
    "Order placed successfully"
  end
end

# Использование (Client)
puts ShopFacade.new.place_order
# => "Order placed successfully"

gets # Пауза
