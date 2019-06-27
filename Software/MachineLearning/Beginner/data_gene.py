#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   data_gene.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/6/27 9:45
@Desc    :
"""

import csv
import numpy as np

if __name__ == '__main__':
    """
    :desc: 生成测试数据
    """

    for index in range(0, 100):
        if np.random.rand() >= 0.5:
            gender = 1    # male
        else:
            gender = 0    # female

        height = 7 * np.random.randn() + (172 if (gender == 1) else 163)
        standand_weight = (height - 105) if (gender == 1) else (height - 110)
        weight = 5 * np.random.randn() + standand_weight

        # print "%d,%d,%d" % (gender, height, weight)
        with open('data.csv', 'ab+') as f:
            writer = csv.writer(f)
            writer.writerow([gender, height, weight])


