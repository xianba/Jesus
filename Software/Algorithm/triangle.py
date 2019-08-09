#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   desc_stats.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/6/10 17:02
@Desc    :
"""

import math


def get_area(x1,y1,x2,y2,x3,y3):

    a = float(math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2))
    b = float(math.sqrt((x2 - x3) ** 2 + (y2 - y3) ** 2))
    c = float(math.sqrt((x3 - x1) ** 2 + (y3 - y1) ** 2))

    s = (a+b+c)/2

    area = math.sqrt(s*(s-a)*(s-b)*(s-c))

    return area
# print get_area(0,0,1,0,1,1)


def inside_trangle(x1, y1, x2, y2, x3, y3, x, y):

    ABC = get_area(x1,y1,x2,y2,x3,y3)
    PBC = get_area(x,y,x2,y2,x3,y3)
    PAC = get_area(x1,y1,x,y,x3,y3)

    PAB = get_area(x1,y1,x2,y2,x,y)

    return (ABC == PBC + PAC + PAB)


print inside_trangle(0,0,1,0,1,1,1,0)
print inside_trangle(0,0,1,0,1,1,0,1)

