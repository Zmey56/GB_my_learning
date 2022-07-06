# 6. * Реализовать структуру данных «Товары». Она должна представлять собой список кортежей.
# Каждый кортеж хранит информацию об отдельном товаре. В кортеже должно быть два элемента —
# номер товара и словарь с параметрами (характеристиками товара: название, цена, количество, единица измерения).
# Структуру нужно сформировать программно, т.е. запрашивать все данные у пользователя.
# Пример готовой структуры:
# [
# (1, {“название”: “компьютер”, “цена”: 20000, “количество”: 5, “eд”: “шт.”}),
# (2, {“название”: “принтер”, “цена”: 6000, “количество”: 2, “eд”: “шт.”}),
# (3, {“название”: “сканер”, “цена”: 2000, “количество”: 7, “eд”: “шт.”})
# ]
# Необходимо собрать аналитику о товарах. Реализовать словарь, в котором каждый ключ — характеристика товара,
# например название, а значение — список значений-характеристик, например список названий товаров.
# Пример:
# {
# “название”: [“компьютер”, “принтер”, “сканер”],
# “цена”: [20000, 6000, 2000],
# “количество”: [5, 2, 7],
# “ед”: [“шт.”]
# }

# cтруктуру формирую программно и запрашиваю все данные у пользователя.

count_prod = int(input('How many products?\n'))
all_prod = []
#i = 1
number_prod = 1

while count_prod > 0:
    count_spec = int(input('How many characteristics does the product number {0} have?\n'.format(number_prod)))
    j = 0
    prod = {}
    while j < count_spec:
        prod_spec = input('Enter the product\'s characteristic and value separated by a space\n').split()
        prod[prod_spec[0]] = prod_spec[1]
        j = j + 1
    all_prod.append((number_prod, prod))
    number_prod = number_prod + 1
    count_prod = count_prod - 1


# получаю уникальные значения характеристик всех товаров, так как в задании не указано что они должны совпадать
specifications = []

for prod in all_prod:
    specifications = specifications + list(prod[1].keys())

specifications = (list(set(specifications)))


# завожу всю полученные аналитику в словарь
all_analytics = {}

for spec in specifications:
    spec_analytics = []
    for prod in all_prod:
        spec_analytics.append(prod[1].get(spec))
    all_analytics[spec] = spec_analytics

print(all_analytics)



