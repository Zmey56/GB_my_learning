# 4. Пользователь вводит строку из нескольких слов, разделённых пробелами. Вывести каждое слово с новой строки.
# Строки необходимо пронумеровать. Если в слово длинное, выводить только первые 10 букв в слове.
string = input('Enter a string.\n')

string_split = string.split()

for i, s in enumerate(string_split):
    if len(s) < 10:
        print(str(i) + " " + s)
    else:
        print(str(i) + " " + s[:10])


