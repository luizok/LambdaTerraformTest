import unittest

from main import main_function


class MainTest(unittest.TestCase):

    def test_main_function_success(self):

        res = main_function(1, 2)
        self.assertEqual(res, 3)

    def test_main_function_fail(self):

        res = main_function(1, 2)
        self.assertNotEqual(res, 2)
