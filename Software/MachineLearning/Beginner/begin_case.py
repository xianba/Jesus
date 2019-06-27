#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   machinelearning.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/6/27 10:20
@Desc    :
"""

from sklearn.linear_model import LinearRegression
import pandas as pd

if __name__ == '__main__':
    """
    :desc: 监督机器学习
    """

    # 1.加载训练数据
    train_data = pd.read_csv("./data.csv")

    # 2.根据加载的数据训练模型
    learn_model = LinearRegression()    # 采用的训练模型
    learn_model.fit(train_data[['Gender', 'Height']], train_data['Weight'])

    # 3.根据模型作预测
    print learn_model.predict([[1, 172]])
