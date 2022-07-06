# 6. Реализовать два небольших скрипта:
# а) итератор, генерирующий целые числа, начиная с указанного,
# б) итератор, повторяющий элементы некоторого списка, определенного заранее.
# Подсказка: использовать функцию count() и cycle() модуля itertools. Обратите внимание, что создаваемый цикл не должен
# быть бесконечным. Необходимо предусмотреть условие его завершения.
# Например, в первом задании выводим целые числа, начиная с 3, а при достижении числа 10 завершаем цикл. Во втором также
# необходимо предусмотреть условие, при котором повторение элементов списка будет прекращено.
from sys import argv
from itertools import count
from itertools import cycle

start = int(argv[1])
end = int(argv[2])

for i in count(start):
    if i > end:
        break
    else:
        print(i)

obj = argv[3]

j = 0
for o in cycle(obj):
    if j > end:
        break
    else:
        print(o)
        j += 1