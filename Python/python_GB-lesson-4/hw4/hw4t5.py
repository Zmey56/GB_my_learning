# 5. Реализовать формирование списка, используя функцию range() и возможности генератора. В список должны войти
# четные числа от 100 до 1000 (включая границы). Необходимо получить результат вычисления произведения всех элементов
# списка.
# Подсказка: использовать функцию reduce().

from functools import reduce

first_list = [i for i in range(100, 1001) if i % 2 == 0]

result = reduce((lambda x, y: x * y), first_list)

print(result)

# второй способ
product = 1

for num in first_list:
    product = product * num

print(product)