# 4. Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные.
# При этом английские числительные должны заменяться на русские.
# Новый блок строк должен записываться в новый текстовый файл.

change = {'One' : 'Один', 'Two' : 'Два', 'Three' : 'Три', 'Four' : 'Четыре'}
result = []

with open('text_3.txt', 'r') as my_file:
    for line in my_file:
        result.append(change.get(line.split()[0]) + ' - ' + line.split()[2])


with open('text_3_result.txt', 'w') as my_file_2:
    for item in result:
        my_file_2.writelines(item+'\n')