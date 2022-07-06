# 1. Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем.
# Об окончании ввода данных свидетельствует пустая строка.

my_file = open('text.txt', 'w')
text = input('Enter еруtext\n')

while True:
    if not text:
        break
    else:
        my_file.writelines(text+'\n')
        text = input('Enter text\n')

my_file.close()