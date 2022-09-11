import pymysql
import json

endpoint = 'database-1.ca2cs6jnjik4.us-east-2.rds.amazonaws.com'
username = 'admin'
password = ''
database_name = 'Social_Forcasts'


connection = pymysql.connect(host=endpoint, user=username, passwd=password, db=database_name)

def lambda_handler (event, context):
    cursor = connection.cursor()
    cursor.execute('CALL get_recent()')
    
    rows = cursor.fetchall()
    
    data = rows[0]
    
    
    weather_response = {}
    weather_response['main'] = data[1]
    weather_response['feels_like'] = data[2]
    
    responseObject = {}
    responseObject['statusCode'] = 200
    responseObject['headers'] = {}
    responseObject['headers']['Content-Type'] = 'application/json'
    responseObject['body'] = json.dumps(weather_response)
    
    return responseObject
