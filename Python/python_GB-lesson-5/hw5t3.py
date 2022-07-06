# 3. Создать текстовый файл (не программно), построчно записать фамилии сотрудников и величину их окладов.
# Определить, кто из сотрудников имеет оклад менее 20 тыс., вывести фамилии этих сотрудников.
# Выполнить подсчет средней величины дохода сотрудников.

with open('salary.txt') as my_file:
    salary = 0
    poor = []
    count_name  = 0
    for line in my_file:
        sal = int(line.split()[1])
        if sal < 20000:
            poor.append(line.split()[0])
        salary = salary + sal
        count_name += 1
    print('This employees have a salary less 20000:')
    for i in poor:
        print(i)
    print(f'Average employee income is {salary/count_name}')