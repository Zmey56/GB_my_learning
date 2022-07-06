# 6. Реализовать функцию int_func(), принимающую слово из маленьких латинских букв и возвращающую его же,
# но с прописной первой буквой. Например, print(int_func(‘text’)) -> Text.
# Продолжить работу над заданием. В программу должна попадать строка из слов, разделенных пробелом.
# Каждое слово состоит из латинских букв в нижнем регистре.
# Сделать вывод исходной строки, но каждое слово должно начинаться с заглавной буквы.
# Необходимо использовать написанную ранее функцию int_func().

def int_func(str):
    return str.title()

print(int_func('friends'))

def int_func_2(strlarge):
    list_word = strlarge.split()
    caplistword = map(int_func, list_word)
    return ' '.join(caplistword)

print(int_func_2('they are friends from the UK'))