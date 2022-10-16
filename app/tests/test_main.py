import unittest

from main import lambda_handler


class MainTest(unittest.TestCase):

    def test_lambda_handler_success(self):

        res = lambda_handler({'numbers': [1, 2]}, None)
        self.assertEqual(res, 3)

    def test_lambda_handler_fail(self):

        res = lambda_handler({'numbers': [-1, 1]}, None)
        self.assertNotEqual(res, 1)

    def test_lambda_handler_negative_success(self):

        res = lambda_handler({'numbers': [-1, -1]}, None)
        self.assertEqual(res, -2)
