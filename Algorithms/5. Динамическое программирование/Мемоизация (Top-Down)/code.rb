# Рекурсивная функция без мемоизации, сложность O(2^n)
def fib_naive(n) = n <= 1 ? n : fib_naive(n - 1) + fib_naive(n - 2)

# Рекурсивная функция с мемоизацией, сложность O(n)
def fib_memo(n)
  @cache ||= {}
  return @cache[n] if @cache.key?(n)

  @cache[n] = n <= 1 ? n : fib_memo(n - 1) + fib_memo(n - 2)
end

# Пример запуска для проверки
puts fib_memo(50) # Отработает мгновенно благодаря кэшу
