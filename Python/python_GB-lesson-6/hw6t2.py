# 2. Реализовать класс Road (дорога), в котором определить атрибуты: length (длина), width (ширина).
# Значения данных атрибутов должны передаваться при создании экземпляра класса. Атрибуты сделать защищенными.
# Определить метод расчета массы асфальта, необходимого для покрытия всего дорожного полотна.
# Использовать формулу: длина * ширина * масса асфальта для покрытия одного кв метра дороги асфальтом,
# толщиной в 1 см * чи сло см толщины полотна. Проверить работу метода.
# Например: 20м * 5000м * 25кг * 5см = 12500 т

class Road:
    _length = None
    _width = None

    def __init__(self, length, width):
        self._length = length
        self._width = width

    def asphaltmasses(self):
        mass = int(input('The mass of asphalt for covering one square meter of road with asphalt \n'))
        thick = int(input('Thickness of the web \n'))
        am = self._width * self._length * mass * thick
        print(f'Masses asphalt is {am}')
        return am

ex = Road(20, 5000)

ex.asphaltmasses()


