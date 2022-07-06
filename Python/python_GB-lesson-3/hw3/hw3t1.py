# 1. Реализовать функцию, принимающую два числа (позиционные аргументы) и выполняющую их деление.
# Числа запрашивать у пользователя, предусмотреть обработку ситуации деления на ноль.

first_number = int(input("Enter first number:\n"))
second_number = int(input("Enter second number:\n"))

def divide(first, second):
    if second == 0:
        print("На ноль делить нельзя")
    else:
        print (first/second)

divide(first_number, second_number)