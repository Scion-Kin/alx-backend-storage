#!/usr/bin/env python3
""" Defines a function """


def insert_school(mongo_collection, **kwargs):
    """ Inserts documents into a mongo collection """

    ins = mongo_collection.insert_one(kwargs)

    return ins.inserted_id
