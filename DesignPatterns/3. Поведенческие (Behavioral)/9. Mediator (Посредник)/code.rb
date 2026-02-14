# ruby
# Посредник (Mediator): управляет регистрацией и пересылкой сообщений
class Chatroom
  def initialize = @users = []
  # Регистрация пользователя в чате
  def register(user)
    @users << user; user.chatroom = self
  end
  # Отправка сообщения всем пользователям, кроме отправителя
  def send(sender, message)
    @users.reject { |u| u == sender }.each do |u|
      u.receive(sender, message) # Каждому вызывается метод получения сообщения
    end
  end
end

# Коллеги (Colleagues): общаются через посредника
class User
  attr_accessor :chatroom
  attr_reader :name
  def initialize(name) = @name = name
  # Отправка сообщения через посредника
  def send(message)
    puts "#{@name} отправляет: #{message}"
    chatroom.send(self, message)
  end
  # Получение сообщения от другого пользователя
  def receive(sender, message) = puts "#{@name} получил от #{sender.name}: #{message}"
end

# Использование
chat = Chatroom.new
alice = User.new("Алиса")
bob = User.new("Боб")
charlie = User.new("Чарли")
[alice, bob, charlie].each { |u| chat.register(u) } # или по одному: chat.register(alice)
alice.send("Всем привет!") # Боб и Чарли получат сообщение, Алиса - нет.

gets # Пауза
