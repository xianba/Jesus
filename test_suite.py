# -*- coding: utf-8 -*-

import unittest
# from test_mathfunc import TestMathFunc
from test_mathfunc_setUptearDown import TestMathFunc

if __name__ == '__main__':
    suite = unittest.TestSuite()

    tests = [TestMathFunc("test_add"), TestMathFunc("test_minus"), TestMathFunc("test_divide")]
    suite.addTests(tests)

    runner = unittest.TextTestRunner(verbosity=2)
    runner.run(suite)