# 2. Создайте собственный класс-исключение, обрабатывающий ситуацию деления на нуль. Проверьте его работу на данных, вводимых пользователем.
# При вводе пользователем нуля в качестве делителя программа должна корректно обработать эту ситуацию и не завершиться с ошибкой.

class OwnError(Exception):
    def __init__(self, txt):
        self.txt = txt


inp_data = input("Enter the numerator: ")
inp_data_2 = input("Enter the denominator: ")

try:
    inp_data = int(inp_data)
    inp_data_2 = int(inp_data_2)
    if inp_data_2 == 0:
        raise OwnError("Вы ввели ноль как знаменатель!")
except ValueError:
    print("Вы ввели не число")
except OwnError as err:
    print(err)
else:
    print(f"Все хорошо. Ваш результат: {inp_data / inp_data_2}")
