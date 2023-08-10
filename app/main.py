import requests


def lambda_handler(event, context):

    res = requests.get('https://www.google.com')
    print(res)

    return sum(event['numbers'])


if __name__ == '__main__':

    lambda_handler({'numbers': [1, 2, 3]}, None)
