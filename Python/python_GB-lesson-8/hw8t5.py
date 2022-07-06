# 5. Продолжить работу над первым заданием. Разработать методы, отвечающие за приём оргтехники на склад и передачу в
# определенное подразделение компании. Для хранения данных о наименовании и количестве единиц оргтехники,
# а также других данных, можно использовать любую подходящую структуру, например словарь.
# from abc import abstractmethod
#
# class Wareclass:
#     wareclass = {}
#     @abstractmethod
#     def reception_of_eq(self):
#         pass
#
# class OfficeEquipment(Wareclass):
#     def __init__(self, unit):
#         self.office_equipment = {}
#
#     @staticmethod
#     def reception_of_eq(**kwargs):
#         equpment = kwargs
#         unit_eq = {}
#         while True:
#             unit = input(f'Enter the name: ')
#             if unit == 'stop':
#                 break
#             unit_p = input(f'Enter the price per unit of the model: ')
#             unit_q = input(f'Enter the number of model: ')
#             unit_q = int(unit_q)
#             unit_p = int(unit_p)
#             unit_eq[unit] = {'Price per unit': unit_p, 'Quantity': unit_q}
#         #print(unit_eq)
#         return unit_eq
#
# class Printer(OfficeEquipment):
#     def __init__(self):
#
#     def reception_of_printer(self):
#         #printer = {}
#         print(OfficeEquipment.reception_of_eq({'Type': 'Printer'}))
#         # print(printer)
#         # self.office_equipment.update(printer)
#         print(self.office_equipment)
#
#
# tmp = Printer()
# Printer.reception_of_eq()
#
#
#
# # class Scanner(OfficeEquipment):
# #     def __init__(self):
# #         super().__init__()
# #         self.scanner_eq = {}
# #
# #     def reception_of_scanner(self):
# #         while True:
# #             print(f'Entering scanner data. If you want to stop, enter \'stop\'')
# #             unit = input(f'Enter the name of the scanner: ')
# #             unit_p = input(f'Enter the price per unit of the scanner: ')
# #             unit_q = input(f'Enter the number of scanner: ')
# #             if unit == 'stop' or unit_p == 'stop' or unit_q == 'stop':
# #                 break
# #             unit_q = int(unit_q)
# #             unit_p = int(unit_p)
# #             unique = {'Device model': unit, 'Price per unit': unit_p, 'Quantity': unit_q}
# #             self.scanner_eq.update(unique)
# #             self.office_equipment.append(self.scanner_eq)
# #             self.wareclass.append(self.office_equipment)
# #
# # class Copier(OfficeEquipment):
# #     def __init__(self):
# #         super().__init__()
# #         self.copier_eq = {}
# #
# #     def reception_of_copier(self):
# #         while True:
# #             print(f'Entering copier data. If you want to stop, enter \'stop\'')
# #             unit = input(f'Enter the name of the copier: ')
# #             unit_p = input(f'Enter the price per unit of the copier: ')
# #             unit_q = input(f'Enter the number of copier: ')
# #             if unit == 'stop' or unit_p == 'stop' or unit_q == 'stop':
# #                 break
# #             unit_q = int(unit_q)
# #             unit_p = int(unit_p)
# #             unique = {'Device model': unit, 'Price per unit': unit_p, 'Quantity': unit_q}
# #             self.copier_eq.update(unique)
# #             self.office_equipment.append(self.copier_eq)
# #             self.wareclass.append(self.office_equipment)

