# 3. Реализовать функцию my_func(), которая принимает три позиционных аргумента, и возвращает сумму наибольших
# двух аргументов.

def my_func(x, y, z):
    l = [x, y, z]
    min_value = min(l)
    l.remove(min_value)
    return (sum(l))

print(my_func(1, 2, 3))