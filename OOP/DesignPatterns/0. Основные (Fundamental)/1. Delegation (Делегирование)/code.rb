# ruby
require 'forwardable'

class LineItem
  extend Forwardable
  attr_reader :product

  def initialize(product) = @product = product # синтаксис Endless Methods ("бесконечные методы")

  # Способ А: делегирование методов через Forwardable
  def_delegators :@product, :sku, :name, :price # делегирование методов

  # Способ Б: ручное делегирование методов 
  # def sku = product.sku
  # def name = product.name
  # def price = product.price
end

Product = Struct.new(:sku, :name, :price)
product = Product.new('ABC123', 'Book', 10.0)
item = LineItem.new(product)
puts item.name # (вызовет product.name) => "Book"

gets # Пауза
