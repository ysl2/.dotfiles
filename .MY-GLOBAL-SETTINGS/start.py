#!/bin/python3
import os


def traverse(thing):
    if os.path.isfile(thing):
        print(os.path(thing))
        return
    items = os.listdir(thing)
    for item in items:
        traverse(item)

print(os.path.curdir)
