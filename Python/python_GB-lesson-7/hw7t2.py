# 2. Реализовать проект расчета суммарного расхода ткани на производство одежды. Основная сущность (класс) этого проекта — одежда,
# которая может иметь определенное название. К типам одежды в этом проекте относятся пальто и костюм. У этих типов одежды существуют параметры:
# размер (для пальто) и рост (для костюма). Это могут быть обычные числа: V и H, соответственно.
# Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто (V/6.5 + 0.5), для костюма (2 * H + 0.3).
# Проверить работу этих методов на реальных данных.
# Реализовать общий подсчет расхода ткани. Проверить на практике полученные на этом уроке знания: реализовать абстрактные классы для основных
# классов проекта, проверить на практике работу декоратора @property.
from abc import ABC, abstractmethod


class Clothes:
    sum_fabric_consumption = 0
    size_cl = 0

    def __init__(self, size_cl):
        self.size_cl = size_cl

    @abstractmethod
    def fabric_consumption(ABC):
        pass

    @property
    def square(self):
        return str(f'Площадь общая ткани {self.sum_fabric_consumption}')

class Coat(Clothes):
    def fabric_consumption(self):
        S = self.size_cl/6.5 + 0.5
        print(S)
        Clothes.sum_fabric_consumption = Clothes.sum_fabric_consumption + S

class Suit(Clothes):
    def fabric_consumption(self):
        S = 2 * self.size_cl + 0.3
        print(S)
        Clothes.sum_fabric_consumption = Clothes.sum_fabric_consumption + S


print(Clothes.sum_fabric_consumption)
coat = Coat(4)
coat.fabric_consumption()
print(Clothes.sum_fabric_consumption)
print(coat.square)
suit = Suit(2)
suit.fabric_consumption()
print(Clothes.sum_fabric_consumption)
print(suit.square)

coat_2 = Coat(4)
coat_2.fabric_consumption()
print(Clothes.sum_fabric_consumption)
print(coat_2.square)
suit_2 = Suit(2)
suit_2.fabric_consumption()
print(Clothes.sum_fabric_consumption)
print(suit_2.square)
