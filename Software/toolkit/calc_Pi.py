#!/usr/bin/env python
# encoding: utf-8

"""
@version: python3
@author: xiaxianba
@license: Apache Licence
@contact: scuxia@gmail.com
@site: http://weibo.com/xiaxianba
@software: PyCharm
@file: calc_Pi.py
@time: 2019/10/22 11:17
@describe:
    根据蒙特卡罗方法计算Pi值
"""


from random import random
from math import sqrt
import time

if __name__ == "__main__":
    """
    :desc: 入口函数
    """

    total = 10000000
    hits = 0
    start = time.perf_counter()

    for i in range(1, total):
        x, y = random(), random()
        dist = sqrt(x ** 2 + y ** 2)
        if dist <= 1.0:
            hits = hits + 1
    pi = 4 * (hits / total)
    end = time.perf_counter()

    print("Pi=", pi)
    print("Time Cost:", start - end)

