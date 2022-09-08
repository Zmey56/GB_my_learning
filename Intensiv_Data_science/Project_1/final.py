import os
import datetime

class Logger:
    day = 0
    month = 0
    year = 0
    hour = 0
    minute = 0
    second = 0
    path = ''

    def __init__(self, path='.'):
        Logger.fill_date()
        Logger.path = path
        if path != '.':
            if not os.path.exists(path):
                os.makedirs(f"./{path}")
            Logger.path = f'./{path}'
        with open(f"{path}/log_{Logger.day}.{Logger.month}.{Logger.year}.log", "w"):
            pass

    @staticmethod
    def today():
        current_date = datetime.datetime.now()
        return {'day': current_date.day,
                'month': current_date.month,
                'year': current_date.year,
                'hour': current_date.hour,
                'minute': current_date.minute,
                'second': current_date.second}

    @classmethod
    def fill_date(clf):
        current_date = clf.today()
        Logger.day = current_date.day
        Logger.month = current_date.month
        Logger.year = current_date.year
        Logger.hour = current_date.hour
        Logger.minute = current_date.minute
        Logger.second = current_date.second

l = Logger('logs/log_2')