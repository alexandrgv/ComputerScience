# ruby
# Товар
class Product
  def price = 100
end

# Коробка, в которую можно вкладывать товары или другие коробки
class Box
  attr_reader :children
  def initialize = @children = []
  def <<(item) = (@children << item; self) # Возвращаем self для цепочки <<
  def price = @children.sum(&:price) # Компоновщик
end

# Использование: в коробку кладем товар и еще одну коробку с товаром
box = Box.new
box << Product.new << (Box.new << Product.new)
puts box.price # => 200

gets # Пауза
