#!/usr/bin/env python3
""" Defines a function """


def list_all(mongo_collection):
    ''' returns all documents in a collection '''

    return mongo_collection.find()
