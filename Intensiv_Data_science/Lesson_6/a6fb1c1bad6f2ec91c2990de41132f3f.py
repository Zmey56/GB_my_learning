# import random
#
#
# def monty_hall(choice, change):
#     doors = random.randrange(1, 4)
#     if doors == choice:
#         if change:
#             return False
#         else:
#             return True
#     else:
#         if change:
#             return True
#         else:
#             return False
#
# games = 100000
# result = 0
#
# for i in range(games):
#     choice = random.randrange(1, 4)
#     if monty_hall(choice, False):
#         result += 1
#
# # print(f'Поменяли дверь и выиграли: {round(result/games*100, 2)}')
# print(f'Оставили дверь и выиграли: {round(result/games*100, 2)}')

# with open('./test.txt', 'a', encoding="UTF-8") as f:
#     f.write('Some thing \n')

# with open('./test.txt', 'r', encoding="UTF-8") as f:
#      for line in f:
#         print(line)

# import csv


# with open('./files/data.csv', 'r', encoding='UTF-8') as f:
#     reader = csv.reader(f, delimiter=',')
#     for line in reader:
#         print(line)


# with open('./files/data.csv', 'a', encoding='UTF-8') as f:
#     reader = csv.DictReader(f, delimiter=',')
#     fieldnames = reader.fieldnames
#     print(fieldnames)
#     result = 0
#     for row in reader:
#         # print(row.get('industry_name_ANZSIC'), row.get('value'), row.get('unit'))
#         try:
#             result += int(row.get('value'))
#         except:
#             pass
#     print(result)

# import json

# with open("./files/weather.json", 'r') as f:
#     data = json.load(f)
#     print(data.get('main').get('temp')-313.75)

# with open("./files/text_j", 'r') as f:
#     data = f.read()                     # Получаем строку
#     info = json.loads(data)             # Читаем строку
#     print(info)

# with open("out.json", 'w') as f:
#     data = {'one': 100, "two": 200, "three": 500}
#     json.dump(data, f)

# data = {'one': 100, "two": 200, "three": 500}
#
# with open("out.txt", 'w') as f:
#     f.write(json.dumps(data))


# from random import randrange
# randrange(1,3)

import hashlib

from my_lib import main
main.args_fn('1', '2', '4')



