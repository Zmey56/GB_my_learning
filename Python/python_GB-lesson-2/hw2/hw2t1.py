# 1. Создать список и заполнить его элементами различных типов данных. Реализовать скрипт проверки типа данных
# каждого элемента. Использовать функцию type() для проверки типа. Элементы списка можно не запрашивать у пользователя,
# а указать явно, в программе.

tmp_list = [1,2,3, 'string', None]

def checkList(list_of_items):
    ls = [type(item) for item in list_of_items]
    return(ls)

print(checkList(tmp_list))