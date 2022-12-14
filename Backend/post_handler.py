import pymysql

endpoint = 'database-1.ca2cs6jnjik4.us-east-2.rds.amazonaws.com'
username = 'admin'
password = ''
database_name = 'Social_Forcasts'


connection = pymysql.connect(host=endpoint, user=username, passwd=password, db=database_name)

def lambda_handler (event, context):
    cursor = connection.cursor()

    weather_main = event['queryStringParameters']['main']
    weather_feels_like = event['queryStringParameters']['feels_like']

    cursor.execute(f"CALL add_forcast('{weather_main}', {weather_feels_like})")

    response = {}
    response['statusCode'] = 201
    response['headers'] = {}
    response['headers']['Content-Type'] = "application/json"

    return response
