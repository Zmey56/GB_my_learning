# 2. Для списка реализовать обмен значений соседних элементов, т.е. Значениями обмениваются элементы с индексами 0 и 1, 2 и 3 и т.д.
# При нечетном количестве элементов последний сохранить на своем месте. Для заполнения списка элементов необходимо использовать
# функцию input().

tmp_list_2 = []
n = int(input("Enter number of elements:\n"))

for i in range(0, n):
    ele = int(input('Введите число\n'))
    tmp_list_2.append(ele)

new_list = []

i = 0

while (i + 1 < len(tmp_list_2)):
    # print(i)
    if i != 0:
        if i % 2 == 0:
            new_list.append(tmp_list_2[i + 1])
        else:
            new_list.append(tmp_list_2[i - 1])
    else:
        new_list.append(tmp_list_2[i + 1])
    i = i + 1

if (len(tmp_list_2) % 2 != 0):
    new_list.append(tmp_list_2[len(tmp_list_2) - 1])

print('Old list ', tmp_list_2)
print('New list ', new_list)