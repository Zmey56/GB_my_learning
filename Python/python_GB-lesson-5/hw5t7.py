# 7. Создать (не программно) текстовый файл, в котором каждая строка должна содержать данные о фирме: название, форма собственности, выручка, издержки.
# Пример строки файла: firm_1 ООО 10000 5000.
# Необходимо построчно прочитать файл, вычислить прибыль каждой компании, а также среднюю прибыль. Если фирма получила убытки, в расчет средней прибыли ее не включать.
# Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями, а также словарь со средней прибылью. Если фирма получила убытки, также добавить ее в словарь (со значением убытков).
# Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].
# Итоговый список сохранить в виде json-объекта в соответствующий файл.
# Пример json-объекта:
# [{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]

# Подсказка: использовать менеджеры контекста.

import codecs
import json

average_profit = 0
count_profit = 0
full_dict = {}
full = []

with codecs.open('text_7.txt', 'r', "utf_8_sig") as my_file:
    for line in my_file:
        firm_list = line.split()
        profit = int(firm_list[2]) - int(firm_list[3])
        if profit>0:
            average_profit = average_profit + profit
            count_profit += 1
        full_dict[firm_list[0]] = profit


full = [full_dict, {"average_profit": int(average_profit/count_profit)}]

with open("text_7.json", "w") as write_f:
    json.dump(full, write_f)

