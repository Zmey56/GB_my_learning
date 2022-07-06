# 5. Реализовать структуру «Рейтинг», представляющую собой не возрастающий набор натуральных чисел. У пользователя
# необходимо запрашивать новый элемент рейтинга. Если в рейтинге существуют элементы с одинаковыми значениями,
# то новый элемент с тем же значением должен разместиться после них.
# Подсказка. Например, набор натуральных чисел: 7, 5, 3, 3, 2.
# Пользователь ввел число 3. Результат: 7, 5, 3, 3, 3, 2.
# Пользователь ввел число 8. Результат: 8, 7, 5, 3, 3, 2.
# Пользователь ввел число 1. Результат: 7, 5, 3, 3, 2, 1.
# Набор натуральных чисел можно задать непосредственно в коде, например, my_list = [7, 5, 3, 3, 2].

my_list = [7, 5, 3, 3, 2]

num = int(input('Enter a new reiting\n'))

index = 0

if num > my_list[0]:
    my_list.insert(index, num)
elif num < my_list[len(my_list)-1]:
    index = len(my_list)
    my_list.insert(index, num)
elif num in my_list:
    index = [i for i, x in enumerate(my_list) if x==num][-1]
    my_list.insert(index, num)
else:
    index = [i for i, x in enumerate(my_list) if x < num][0]
    my_list.insert(index, num)

print(my_list)
