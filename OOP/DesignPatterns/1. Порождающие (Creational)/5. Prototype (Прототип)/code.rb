# ruby
class Order
  attr_accessor :items, :client
  def initialize(items, client)
    @items = items; @client = client
  end
  # Реализация паттерна Прототип
  def clone
    Marshal.load(Marshal.dump(self))
  end
end

original = Order.new(['Book'], 'Alice')
copy = original.clone
pp original, copy

gets # Пауза
