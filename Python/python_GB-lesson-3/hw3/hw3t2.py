# Реализовать функцию, принимающую несколько параметров, описывающих данные пользователя: имя, фамилия, год рождения,
# город проживания, email, телефон. Функция должна принимать параметры как именованные аргументы. Реализовать вывод
# данных о пользователе одной строкой.

f_n = input('What\'s your first name?')
l_n = input('What\'s your last name?')
y_b = input('What\'s your year of birth?')
c_r = input('What\'s your city of residence?')
em = input('What\'s your email?')
ph = input('What\'s your phone?')

def print_info(firstname = f_n, lastname=l_n, year=y_b, city= c_r, email=em, phone=ph):
    print(firstname, lastname, year, city, email, phone)

print_info()