#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   QueueManage.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/6/25 16:33
@Desc    :
"""

import sys

a = 0
b = 0
c = 0
list_A = []
list_B = []
list_C = []

pos_dict = {"BankService": list_A,
            "InsureService": list_B,
            "FinanceService": list_C}


def append_queue():
    """
    :desc 排队系统
    :return:
    """
    global a, b, c

    while True:
        choice = input('请选择业务类型：1.银行卡业务 2.社保卡业务 3.金融卡业务 4.退出 \n')

        if choice == 1:
            a += 1
            A_num = "A" + str(a)
            list_A.append(A_num)
            pos_dict["BankService"] = list_A
            print "你的排队号码是A%d,当前你选择的是银行卡业务。\n" % a

        elif choice == 2:
            b += 1
            B_num = "B" + str(b)
            list_B.append(B_num)
            pos_dict["InsureService"] = list_B
            print "你的排队号码是B%d,当前你选择的是社保卡业务。\n" % b

        elif choice == 3:
            c += 1
            C_num = "C" + str(c)
            list_C.append(C_num)
            pos_dict["FinanceService"] = list_C
            print "你的排队号码是B%d,当前你选择的是金融卡业务。\n" % c
        else:
            # sys.exit() and break
            return


def pop_queue():
    """
    :desc 叫号系统
    :return:
    """

    while True:
        choice = input('请输入当前窗口类型：1.银行卡业务 2.社保卡业务 3.金融卡业务 4.退出 \n')

        if choice == 1:
            if len(list_A) == 0:
                print "目前银行卡业务窗口空闲，无人排队"
            else:
                pop_num = list_A.pop(0)
                print "请%s号客户前往银行卡业务窗口办理业务，当前排队人数为%d人\n" % (pop_num, len(list_A))

        elif choice == 2:
            if len(list_B) == 0:
                print "目前社保卡业务窗口空闲，无人排队"
            else:
                pop_num = list_B.pop(0)
                print "请%s号客户前往社保卡业务窗口办理业务，当前排队人数为%d人\n" % (pop_num, len(list_B))

        elif choice == 3:
            if len(list_C) == 0:
                print "目前金融卡业务窗口空闲，无人排队"
            else:
                pop_num = list_C.pop(0)
                print "请%s号客户前往金融卡业务窗口办理业务，当前排队人数为%d人\n" % (pop_num, len(list_C))
        else:
            return


if __name__ == '__main__':
    """
    :desc: 主程序
    """
    while True:
        choice = input('请选择您需求：1.取号 2.叫号 3.退出 \n')

        if choice == 1:
            append_queue()
        elif choice == 2:
            pop_queue()
        else:
            break

