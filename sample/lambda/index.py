import os

def lambda_handler(event, context):
    username = os.getenv('username')
    body = f"Hi, {username}! =)"
    return {
        "statusCode": 200,
        "body": body
    }