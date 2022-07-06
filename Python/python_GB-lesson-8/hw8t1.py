# 1. Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата «день-месяц-год».
# В рамках класса реализовать два метода. Первый, с декоратором @classmethod, должен извлекать число, месяц, год и преобразовывать их тип к типу «Число».
# Второй, с декоратором @staticmethod, должен проводить валидацию числа, месяца и года (например, месяц — от 1 до 12).
# Проверить работу полученной структуры на реальных данных.

class Data:
    def __init__(self, data_user):
        self.data_user = data_user

    @classmethod
    def convert_data(cls, data_user):
        data_user_int = list(map(int, data_user.split('-')))
        return data_user_int

    @staticmethod
    def valid_data(data_user_list):
        d = data_user_list[0]
        m = data_user_list[1]
        y = data_user_list[2]

        if 1 <= d <= 31:
            if 1 <= m <= 12:
                if 2021 >= y >= 0:
                    return f'All right'
                else:
                    return f'Wrong year'
            else:
                return f'Wrong month'
        else:
            return f'Wrong day'




today = Data('11 - 1 - 2001')
today_2 = Data('11 - 11 - 2022')
today_3 = Data('11 - 13 - 2001')
today_4 = Data('42 - 1 - 2001')
print(today.valid_data(today.convert_data(today.data_user)))
print(today_2.valid_data(today_2.convert_data(today_2.data_user)))
print(today_3.valid_data(today_3.convert_data(today_3.data_user)))
print(today_4.valid_data(today_4.convert_data(today_4.data_user)))
