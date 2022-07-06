# 1. Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса (метод __init__()), который должен принимать данные
# (список списков) для формирования матрицы.
# Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
# Примеры матриц вы найдете в методичке.
# Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
# Далее реализовать перегрузку метода __add__() для реализации операции сложения двух объектов класса Matrix (двух матриц).
# Результатом сложения должна быть новая матрица.
# Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент первой строки первой матрицы складываем с первым
# элементом первой строки второй матрицы и т.д.

class Matrix:
    def __init__(self, list_m):
        self.matrix = list_m
        self.row = len(list_m)
        self.col = len(list_m[0])

    def __str__(self):
        s = [[str(e) for e in row] for row in self.matrix]
        lens = [max(map(len, col)) for col in zip(*s)]
        fmt = '\t'.join('{{:{}}}'.format(x) for x in lens)
        table = [fmt.format(*row) for row in s]
        return ('\n'.join(table))

    def __add__(self, other):
        matrix_tmp = [[None] * self.col for _ in range(self.row)]
        for i in range(len(self.matrix)):
            for j in range(len(self.matrix[0])):
                matrix_tmp[i][j] = self.matrix[i][j] + other.matrix[i][j]
        return matrix_tmp


tmp = [[31, 22], [37, 43], [51, 86]]
tmp_a = [[35, 25], [34, 48], [58, 45]]
tmp_2 = [[3,5,32],[2,4,6],[-1,64,-8]]
tmp_3 =[[3,5,8,3],[8,3,7,1]]
matrix_1 = Matrix(tmp)
matrix_2 = Matrix(tmp_a)
print(matrix_1)
print(matrix_1+matrix_2)


