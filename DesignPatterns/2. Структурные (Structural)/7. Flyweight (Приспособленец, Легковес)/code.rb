# ruby
# Flyweight: Общее состояние
class ProductType
  attr_reader :name, :category
  def initialize(name, category) = (@name, @category = name, category)
end

# Factory: Кэширование объектов
class ProductFactory
  @types = {}
  def self.get_type(name, category)
    @types[[name, category]] ||= ProductType.new(name, category)
  end
  def self.count = @types.size
end

# Context: Уникальное состояние + ссылка на Flyweight
class Product
  def initialize(name, category, serial)
    @serial = serial
    @type = ProductFactory.get_type(name, category)
  end
end

# Тест: создаем несколько объектов, но ProductType в памяти только один
n = 5
n.times { |i| Product.new('laptop', 'electronics', "SN-#{"SN-%03d" % (i + 1)}") }

puts "Создано продуктов: #{n}" # => 5
puts "Уникальных типов в памяти: #{ProductFactory.count}" # => 1

gets # Пауза
