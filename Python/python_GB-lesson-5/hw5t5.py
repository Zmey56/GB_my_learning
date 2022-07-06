# 5. Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами.
# Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.

with open('text_4.txt', 'w') as my_file:
    line = input('Enter the numbers separated by a space:\n')
    my_file.write(line)
    print('The sum of the numbers in the file: ', sum(map(int, line.split())))
