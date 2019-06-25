#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   LuckyDog.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/6/25 14:30
@Desc    :
"""

import csv
import random
import sys

AWARDS_SETTING = [1, 2, 3]    # 按照奖项类型设置的奖品数量，例如：3个奖项，一等奖1名，二等奖2名，三等价3名。


def get_total(filename):
    """
    :param filename:
    :return: 参加抽奖总人数
    """
    list_employee = []

    with open(filename) as csvfile:
        file_reader = csv.reader(csvfile)
        for employee in file_reader:
            list_employee.append(employee)

    return list_employee


if __name__ == '__main__':
    """
    :desc: 主程序
    """
    total_employee = get_total("luckydog.csv")

    print "参加抽奖总人数：", len(total_employee)
    if sum(AWARDS_SETTING) > len(total_employee):
        print "奖项大于参加抽奖人数！！！"
        sys.exit()

    print "开始抽奖..."
    for item in range(len(AWARDS_SETTING)):
        list_lucky_dog = []
        for number in range(0, AWARDS_SETTING[item]):
            lucky_dog = random.choice(total_employee)
            list_lucky_dog.append(lucky_dog)
            total_employee.remove(lucky_dog)
        print item, "等奖", len(list_lucky_dog), "名：", list_lucky_dog
