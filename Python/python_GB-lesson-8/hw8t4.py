# 4. Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад. А также класс «Оргтехника»,
# который будет базовым для классов-наследников. Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс).
# В базовом классе определить параметры, общие для приведенных типов. В классах-наследниках реализовать параметры,
# уникальные для каждого типа оргтехники.

class Wareclass:
    pass

class OfficeEquipment(Wareclass):
    def __init__(self):
        self.office_Equipment = {}
    # def __init__(self, name, price, quantity):
    #     self.name = name
    #     self.price = price
    #     self.quantity = quantity

class Printer(OfficeEquipment):
    def __init__(self):
        self.printer_eq = {}
    # def __init__(self, print_speed):
    #     self.print_speed = print_speed

class Scanner(OfficeEquipment):
    def __init__(self):
        self.scanner_eq = {}
    # def __init__(self, scan_speed):
    #     self.scan_speed = scan_speed

class Copier(OfficeEquipment):
    def __init__(self):
        self.copier_eq = {}
    # def __init__(self, copy_speed):
    #     self.copy_speed = copy_speed










