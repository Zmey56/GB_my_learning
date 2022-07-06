# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter
from pymongo import MongoClient
import re


class JobparserPipeline:

    def __init__(self):
        client = MongoClient('localhost', 27017)
        self.mongobase = client.vacancy0912

    def process_item(self, item, spider):
        job = {}
        #print(spider.name)
        if spider.name == 'superjob':
            item['min'], item['max'], item['cur'] = self.process_salary_superjob(item['salary'])
        else:
            item['min'], item['max'], item['cur'] = self.process_salary(item['salary'])

        job['link'] = item['link']
        job['name'] = item['name']
        job['min_sal'] = item['min']
        job['max_sal'] = item['max']
        job['currency'] = item['cur']

        collection = self.mongobase[spider.name]
        collection.insert_one(job)

        return item

    def process_salary(self, salary):
        sal_min = None
        sal_max = None
        sal_cur = None
        salary = list(salary)
        if salary[0] != 'По договорённости':
            for i in range(len(salary)):
                salary[i] = salary[i].replace(u'\xa0', u'')
                salary[i] = salary[i].replace(u' ', u'')
        # print(salary, len(salary))

        if salary[0] == 'до':
            sal_max = salary[1]
            sal_cur = salary[3]
        elif len(salary) == 3 and salary[0].isdigit():
            sal_max = salary[0]
            sal_cur = salary[2]
        elif salary[0] == 'от' and salary[2] == 'до':
            sal_min = salary[1]
            sal_max = salary[3]
            sal_cur = salary[5]
        elif salary[0] == 'от':
            sal_max = salary[1]
            sal_cur = salary[3]

        result = [
            sal_min, \
            sal_max, \
            sal_cur
        ]
        return result

    def process_salary_superjob(self, salary):
        sal_min = None
        sal_max = None
        sal_cur = None
        salary = list(salary)
        # print(salary)
        for i in range(len(salary)):
            salary[i] = salary[i].replace(u'\xa0', u'')
        # print(salary, len(salary))
        # print(salary[0])

        if salary[0] == 'до':
            tmp = re.split('(\d+)',salary[2])
            sal_max = tmp[1]
            sal_cur = tmp[2]
        elif salary[0] == 'от':
            tmp = re.split('(\d+)',salary[2])
            sal_min = tmp[1]
            sal_cur = tmp[2]
        elif salary[0].isdigit() and len(salary) == 3:
            sal_max = salary[0]
            sal_cur = salary[2]
        elif salary[0].isdigit() and len(salary) == 7:
            sal_min = salary[0]
            sal_max = salary[4]
            sal_cur = salary[6]

        result = [
            sal_min, \
            sal_max, \
            sal_cur
        ]
        return result