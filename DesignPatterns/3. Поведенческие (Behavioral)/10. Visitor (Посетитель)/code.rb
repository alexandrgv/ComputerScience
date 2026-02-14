# ruby
class ProductA
  attr_reader :price
  def initialize(price) = @price = price
  def accept(visitor) = visitor.visit_product_a(self)
end

class ProductB
  attr_reader :price
  def initialize(price) = @price = price
  def accept(visitor) = visitor.visit_product_b(self)
end

class DiscountVisitor
  def visit_product_a(product) = product.price * 0.9
  def visit_product_b(product) = product.price * 0.8
end

# Использование
products = [ProductA.new(100), ProductB.new(150)]
visitor = DiscountVisitor.new
discounted = products.map { |p| p.accept(visitor) }
puts discounted  # [90.0, 120.0]

gets # Пауза
