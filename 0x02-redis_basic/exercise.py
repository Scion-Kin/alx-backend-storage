#!/usr/bin/env python3
''' Defines a class '''

from redis import Redis
from typing import Union
from uuid import uuid4


class Cache:
    ''' Defines a class that interacts with redis database '''

    def __init__(self):
        ''' class instance initialization '''

        self._redis = Redis()
        self._redis.flushdb(True)

    def store(self, data: Union[str, bytes, int, float]) -> str:
        ''' stores data and returns the reference id '''

        ref = str(uuid4())
        self._redis.set(ref, data)

        return ref

    def get(self, key, fn):
        ''' Gets a value from the database using a given key '''

        return fn(self._redis.get(key)) if fn else self._redis.get(key)

    def get_str(self, key):
        ''' Gets a string value from the database '''

        return self._redis.get(key).decode('utf-8')

    def get_int(self, key):
        ''' gets an int value from the database '''

        return int(self._redis.get(key))
