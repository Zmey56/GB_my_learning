# 5. Реализовать класс Stationery (канцелярская принадлежность). Определить в нем атрибут title (название) и метод draw (отрисовка).
# Метод выводит сообщение “Запуск отрисовки.” Создать три дочерних класса Pen (ручка), Pencil (карандаш), Handle (маркер). 
# В каждом из классов реализовать переопределение метода draw. Для каждого из классов методы должен выводить уникальное сообщение. 
# Создать экземпляры классов и проверить, что выведет описанный метод для каждого экземпляра.

class Stationery:
    title = None
    
    def __init__(self, title):
        self.title = title
    
    def draw(self):
        print('Запуск отрисовки.')
        
class Pen(Stationery):
    def __init__(self, title):
        super(Pen, self).__init__(title)

    def draw(self):
        print(f'Запуск отрисовки {self.title}.')


class Pencil(Stationery):
    def __init__(self, title):
        super(Pencil, self).__init__(title)

    def draw(self):
        print(f'Запуск отрисовки {self.title}.')


class Handle(Stationery):
    def __init__(self, title):
        super(Handle, self).__init__(title)

    def draw(self):
        print(f'Запуск отрисовки {self.title}.')

pen = Pen('Ручка')
pencil = Pencil('Карандаш')
handle = Handle('Маркер')
pen.draw()
pencil.draw()
handle.draw()