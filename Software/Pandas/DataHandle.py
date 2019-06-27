#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   Pandas_DataHandle.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/6/27 9:00
@Desc    :
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# csv_data = pd.read_csv("./stock.csv")    # pandas从csv中读取数据
csv_data = pd.read_csv('./stock.csv', index_col='DATE', parse_dates=True).sort_index()  # p读取csv数据并按索引排序

print csv_data
print csv_data.index      # 显示索引列
print csv_data['OPEN']    # 显示其他非索引列

# 1.绘制趋势曲线 ######################################################################
plt.plot(csv_data.index, csv_data['CLOSE'], 'b', lw=2.5)
plt.gcf().autofmt_xdate()  # 自动旋转日期标记

plt.grid(True)
plt.axis("tight")
plt.xlabel('Time', size=20)
plt.ylabel('Close', size=20)
plt.title('stock', size=20)

plt.show()


