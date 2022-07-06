# 2. Создать текстовый файл (не программно), сохранить в нем несколько строк, выполнить подсчет количества строк,
# количества слов в каждой строке.

my_file = open('text_2.txt', 'r')
line_count = 0
for line in my_file:
    if line != "\n":
        line_count += 1
        words_in_line = len(line.split())
        print(f'Words in line number {line_count} are {words_in_line}')
my_file.close()
print(f'Text have {line_count} lines')


