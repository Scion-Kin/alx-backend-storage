#!/usr/bin/env python3
''' Defines a class '''

from redis import Redis
from uuid import uuid4
from typing import Union


class Cache:
    ''' Defines a class that interacts with redis database '''

    def __init__(self):
        ''' class instance initialization '''

        self._redis = Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, list]) -> str:
        ''' stores data and returns the reference id '''

        ref = str(uuid4())
        self._redis.set(ref, data)

        return ref
