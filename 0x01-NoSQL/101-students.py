#!/usr/bin/env python3
""" Defines a function """


def top_students(mongo_collection):
    ''' returns all students sorted by average score '''

    return mongo_collection.aggregate([{
                '$project': {
                   '_id': 1,
                   'name': 1,
                   'averageScore': {'$avg': {'$avg': '$topics.score'}}
                }
             },
             {'$sort': {'averageScore': -1}},
         ])
