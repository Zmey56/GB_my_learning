#  4. Реализуйте базовый класс Car. У данного класса должны быть следующие атрибуты: speed, color, name, is_police (булево).
#  А также методы: go, stop, turn(direction), которые должны сообщать, что машина поехала, остановилась, повернула (куда).
#  Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar. Добавьте в базовый класс метод show_speed,
#  который должен показывать текущую скорость автомобиля. Для классов TownCar и WorkCar переопределите метод show_speed.
#  При значении скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите результат.
# Выполните вызов методов и также покажите результат.

class Car:
    speed = None
    color = None
    name = None
    is_police = None

    def __init__(self, speed, color, name, is_police=False):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = is_police

    def go(self):
        return f'{self.name} go'

    def stop(self):
        return f'[self.name] stop'

    def turn(self, direction):
        if direction == 'right':
            return f'{self.name} turned right'
        else:
            return f'{self.name} turned left'

    def show_speed(self):
        return self.speed

class TownCar(Car):
    def __init__(self, speed, color, name, is_police=False):
        super().__init__(speed, color, name, is_police)

    def show_speed(self):
        print(f'Current speed is {self.speed}')

        if self.speed > 60:
            return ('Exceeding the speed limit')
        else:
            return ('Speed is normal')

class SportCar(Car):
    def __init__(self, speed, color, name, is_police=False):
        super().__init__(speed, color, name, is_police)

class WorkCar(Car):
    def __init__(self, speed, color, name, is_police=False):
        super().__init__(speed, color, name, is_police)

    def show_speed(self):
        print(f'Current speed is {self.speed}')

        if self.speed > 40:
            print('Exceeding the speed limit')

class PoliceCar(Car):
    def __init__(self, speed, color, name, is_police=True):
        super().__init__(speed, color, name, is_police)

audi = SportCar(100, 'Red', 'Audi')
oka = TownCar(30, 'White', 'Oka')
print(oka.show_speed())
lada = WorkCar(70, 'Rose', 'Lada')
ford = PoliceCar(110, 'Blue',  'Ford')
direction = 'left'
print(lada.turn(direction))
direction = 'right'
print(oka.turn('right'))
print(f'{lada.go()} with speed exactly {lada.show_speed()}')
print(f'{lada.name} is {lada.color}')
print(f'Is {audi.name} a police car? {audi.is_police}')
print(f'Is {lada.name}  a police car? {lada.is_police}')
print(f'Is {ford.name}  a police car? {ford.is_police}')
print(audi.show_speed())
print(ford.show_speed())
