import requests


def lambda_handler(event, context):

    res = requests.get('https://www.google.com')
    print(res)

    return sum(event['numbers'])
