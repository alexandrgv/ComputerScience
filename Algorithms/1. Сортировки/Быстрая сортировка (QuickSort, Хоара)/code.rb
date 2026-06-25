# Быстрая сортировка (QuickSort, Хоара), сложность O(log n)
def quicksort(arr, left, right)
  if left < right
		middle = (left + right) / 2 # Индекс середины
    pivot = arr[middle] # Опорный элемент из середины
    i, j = left, right # Ставим указатели на левый и правый края

    # Пока указатели не пересеклись
    while i <= j
			# Бежим указателем i ВПРАВО, пока не найдем число, которое больше или равно опорному
      i += 1 while arr[i] < pivot
      # Бежим указателем j ВЛЕВО, пока не найдем число, которое меньше или равно опорному
      j -= 1 while arr[j] > pivot
      # Если указатели еще не пересеклись (индексы валидны), меняем числа местами
      if i <= j
        arr[i], arr[j] = arr[j], arr[i]
        i += 1
        j -= 1
      end
    end

		# Рекурсивно сортируем левую часть (от left до j)
    quicksort(arr, left, j)
    # Рекурсивно сортируем правую часть (от i до right)
    quicksort(arr, i, right)
  end
end

nums = [3, 6, 8, 10, 1, 2, 1]
# На старте left = 0, right = (длина массива - 1)
quicksort(nums, 0, nums.length - 1)
p nums # => [1, 1, 2, 3, 6, 8, 10]
