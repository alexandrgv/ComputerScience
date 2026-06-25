# ruby
class Product
  def price = 50
end

# Декоратор товара, добавляющий ему "гарантию"
class WarrantyDecorator
  def initialize(product) = @product = product
  def price = @product.price + 10
end

# Использование
product = WarrantyDecorator.new(Product.new)
puts product.price  # 60

gets # Пауза
