# ruby
class Product
  attr_reader :properties

  def initialize = @properties = {} # Внутреннее хранилище

  # Интерфейс чтения
  def [](key) = @properties[key]

  # Интерфейс записи
  def []=(key, value)
    @properties[key] = value
  end

  # Доп. метод для получения всех ключей
  def keys = @properties.keys
end

# Использование
product = Product.new
product[:weight] = 2.5        # Запись
product[:color] = "red"       # Запись
puts product[:color]          # Чтение => "red"

gets # Пауза
