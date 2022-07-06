from enum import unique

import pymongo
from pymongo import MongoClient
from pprint import pprint
from pymongo.errors import *

client = MongoClient('127.0.0.1', 27017)

db = client['users2511']

authors = db.authors
books = db.books


authors.create_index([('author', pymongo.TEXT)], name='search_index', unique=True)


# doc = {"_id": 65432168431,
#        "author": "Peter2",
#        "age": 38,
#        "text": "is cool! Wildberry",
#        "tags": ['cool', 'hot', 'ice'],
#        "date": '14.06.1983'}
# try:
#     authors.insert_one(doc)
# except DuplicateKeyError as e:
#     print(e)
#     print(doc['author'])


# authors.insert_many([{"author": "John",                               # Добавляем несколько документов в базу
#                "age" : 29,
#                "text": "Too bad! Strawberry",
#                "tags": 'ice',
#                "date": '04.08.1971'},
#                     { "_id": 123,
#                         "author": "Anna",
#                "age" : 36,
#                "title": "Hot Cool!!!",
#                "text": "easy too!",
#                "date": '26.01.1995'},
#                    {"author": "Jane",
#                "age" : 43,
#                "title": "Nice book",
#                "text": "Pretty text not long",
#                "date": '08.08.1975',
#                "tags":['fantastic', 'criminal']}
#       ])


# result = authors.find_one({})
# if result:
#     pprint(result)
#
#
# result2 = authors.find({})
# if result2:
#     pass          # Всегда True

# for doc in authors.find({'$or': [{'author': 'Peter2'}, {'age': 36}]}):
#     pprint(doc)

# for doc in authors.find({'age': {'$lte': 35}}):
#      pprint(doc)

# for doc in authors.find({'author': {'$regex': 'J.'}}):
#      pprint(doc)

# authors.update_one({'author': 'Petr'}, {'$set': {'gender': 'male'}})
# authors.update_one({'author': 'Petr'}, {'$unset': {'gender': ''}})

new_data = {
    "author": "Andrey",
               "age" : 28,
               "text": "is hot!",
               "date": '11.09.1991'}


authors.insert_one(new_data)
# authors.update_one({'author': 'Peter2'}, {'$set': new_data})
# authors.update_many({'author': 'Peter2'}, {'$set': new_data})
# authors.replace_one({'author': 'Andrey'}, new_data)

# authors.replace_many({'author': 'John'}, new_data)

# result = authors.find_one({})
# result = 123
# authors.replace_one({}, result)


# authors.delete_one({'author': 'John'})
# authors.delete_many({})

for doc in authors.find({}):
     pprint(doc)

