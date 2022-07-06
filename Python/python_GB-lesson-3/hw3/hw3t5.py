# 5. Программа запрашивает у пользователя строку чисел, разделенных пробелом.
# При нажатии Enter должна выводиться сумма чисел.
# Пользователь может продолжить ввод чисел, разделенных пробелом и снова нажать Enter.
# Сумма вновь введенных чисел будет добавляться к уже подсчитанной сумме.
# Но если вместо числа вводится специальный символ, выполнение программы завершается.
# Если специальный символ введен после нескольких чисел, то вначале нужно добавить сумму этих чисел к полученной ранее
# сумме и после этого завершить программу.

def sumstringofvalue():
    all_sum = 0
    while(True):
        symbol = '*'
        str_number = input('Enter a string of numbers separated by a space or a special character \'*\' to end the program:\n')
        str_list = str_number.split()
        if symbol in str_list:
            i = str_list.index(symbol)
            sum_list = sum(map(int, str_list[:i]))
            all_sum = all_sum + sum_list
            print('Сurrent string of numbers: ', sum_list, 'Total amount ', all_sum)
            break
        else:
            sum_list = sum(map(int, str_list))
            all_sum = all_sum + sum_list
            print('Сurrent string of numbers: ', sum_list, 'Total amount ', all_sum)

sumstringofvalue()



