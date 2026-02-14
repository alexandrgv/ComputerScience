# ruby
class EventChannel
  def initialize
    # Создаем хеш, который по умолчанию возвращает пустой массив для новых ключей
    @subscribers = Hash.new { |h, k| h[k] = [] }
  end
  
  # Регистрация интереса к событию
  def subscribe(event_type, &handler)
    @subscribers[event_type] << handler
  end
  
  # Рассылка события всем заинтересованным сторонам
  def publish(event_type, data)
    @subscribers[event_type].each { |handler| handler.call(data) }
  end
end

# Использование
channel = EventChannel.new

# Подписчик A
channel.subscribe(:order_placed) { |data| puts "Логистика: готовим товар #{data[:id]}" }
# Подписчик B
channel.subscribe(:order_placed) { |data| puts "Email: отправка чека на #{data[:email]}" }

# Издатель просто кидает событие в канал, не зная о подписчиках
channel.publish(:order_placed, id: 42, email: "user@example.com")
# => Логистика: готовим товар 42
# => Email: отправка чека на user@example.com

gets # Пауза
