# ruby
require 'singleton'

class AppConfig
  include Singleton
  attr_accessor :theme

  def initialize = @theme = "light" # Начальное состояние
end

# AppConfig.new # Ошибка: метод приватный

# Глобальный доступ:
config = AppConfig.instance
config.theme = "dark"

# В другой части программы:
other_link = AppConfig.instance
puts other_link.theme # => "dark"

gets # Пауза
