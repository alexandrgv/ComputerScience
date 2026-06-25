# Рекурсивная функция без мемоизации, сложность O(2^n)
def fib_naive(n):
    if n <= 1: return n
    return fib_naive(n-1) + fib_naive(n-2)

# Рекурсивная функция с мемоизацией, сложность O(n)
cache = {} # Словарь-стикер
def fib_memo(n):
    if n in cache: return cache[n] # Если уже считали, просто берем из кэша!
    if n <= 1: return n
    result = fib_memo(n-1) + fib_memo(n-2)
    cache[n] = result # Записываем результат в кэш
    return result

# С использованием декоратора @functools.cache
from functools import cache
@cache
def fib_builtin(n):
    return n if n <= 1 else fib_builtin(n-1) + fib_builtin(n-2)

# Пример запуска для проверки
print(fib_builtin(50)) # Отработает мгновенно благодаря кэшу
