#task 1
#Поработайте с переменными, создайте несколько, выведите на экран, запросите у пользователя несколько чисел и строк и сохраните в переменные, выведите на экран.

nameMy = "Alexandr"
ageMy = 41
print("My name is ", nameMy, "and my age is ", ageMy)
nameUser = input("What's your name?")
ageUser = input("What's your age?")
print("User's name is ", nameUser, " and User's age is ", ageUser)

#task 2
#Пользователь вводит время в секундах. Переведите время в часы, минуты и секунды и выведите в формате чч:мм:сс. Используйте форматирование строк.

import time

sec = input("Enter the time in seconds: ")
print(time.strftime('%H:%M:%S', time.gmtime(int(sec))))

#task 3
#Узнайте у пользователя число n. Найдите сумму чисел n + nn + nnn. Например, пользователь ввёл число 3. Считаем 3 + 33 + 333 = 369.

value = input("Enter a number: ")
print(int(value) + int(value + value)+ int(value + value + value))

#task 4
#Пользователь вводит целое положительное число. Найдите самую большую цифру в числе. Для решения используйте цикл while и арифметические операции.

value = input("Enter a number: ")

i=0
maxVal = 0
while(i<len(value)):
    if maxVal < int(value[i]):
        maxVal = int(value[i])
    i+=1
print(maxVal)

# =task 5
# Запросите у пользователя значения выручки и издержек фирмы. Определите, с каким финансовым результатом работает фирма (прибыль — выручка больше издержек, или убыток — издержки больше выручки). Выведите соответствующее сообщение. Если фирма отработала с прибылью, вычислите рентабельность выручки (соотношение прибыли к выручке). Далее запросите численность сотрудников фирмы и определите прибыль фирмы в расчете на одного сотрудника.

rev = int(input("What is your revenue? "))
cost = int(input("What is your cost? "))

if rev >= cost:
    print("You have earned a profit")
    prof = ((rev-cost)/cost)#    print("Profitability: ", prof)
    countWorker = int(input("How many employees are there? "))
    print("Profit per employee ", ((rev-cost)/countWorker))
else:
    print("You have earned a loss")

#task 6
#Спортсмен занимается ежедневными пробежками. В первый день его результат составил a километров. Каждый день спортсмен увеличивал результат на 10 % относительно предыдущего. Требуется определить номер дня, на который общий результат спортсмена составить не менее b километров. Программа должна принимать значения параметров a и b и выводить одно натуральное число — номер дня.

firstDay = int(input("What is your distanсe on the first day? "))
likeDist = int(input("What distance do you prefer? "))

day = 1 #отсчет не с нулевого, а первого дня
distNow = firstDay

while likeDist >= distNow:
    distNow = distNow + distNow*0.1
    day = day + 1

print("Day ", day)







