# # Реализовать проект «Операции с комплексными числами». Создайте класс «Комплексное число»,
# реализуйте перегрузку методов сложения и умножения комплексных чисел.
# Проверьте работу проекта, создав экземпляры класса (комплексные числа) и
# выполнив сложение и умножение созданных экземпляров.
# Проверьте корректность полученного результата.



class ComplexNumber:
    def __init__(self, a, b):
        self.comp_number = (a, b)

    def __add__(self, other):
        result = (self.comp_number[0] + other.comp_number[0], self.comp_number[1] + other.comp_number[1])
        print(f'The sum of a and b is equal of: {result[0]} + {result[1]}i')
        return result

    def __mul__(self, other):
        a = self.comp_number[0]
        b = self.comp_number[1]
        c = other.comp_number[0]
        d = other.comp_number[1]
        result = (a*c - b*d), (a*d + c*b)
        print(f'The multiple of a and b is equal of: {result[0]} + {result[1]}i')
        return result

z_1 = ComplexNumber(1, -2)
z_2 = ComplexNumber(3, 4)
print(z_1)
print(z_1 + z_2)
print(z_1 * z_2)


z_1 = ComplexNumber(1, -2)
z_2 = ComplexNumber(3, 4)
print(z_1)
print(z_1 + z_2)
print(z_1 * z_2)