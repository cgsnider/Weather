import pymysql

endpoint = 'database-1.ca2cs6jnjik4.us-east-2.rds.amazonaws.com'
username = 'admin'
password = 'BoseSoundCloud'
database_name = 'Social_Forcasts'


connection = pymysql.connect(host=endpoint, user=username, passwd=password, db=database_name)

def lambda_handler (event, context):
    cursor = connection.cursor()
    cursor.execute('CALL get_recent()')
    
    rows = cursor.fetchall()

    for row in rows:
        print(f"{row[0]} {row[1]} {row[2]}")
