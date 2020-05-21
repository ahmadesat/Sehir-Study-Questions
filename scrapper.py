import requests
from bs4 import BeautifulSoup

url = "https://www.sehir.edu.tr/tr/duyurular/2019_2020_akademik_yili_bahar_donemi_ders_programi"
page = requests.get(url)

soup = BeautifulSoup(page.content, 'html.parser')
tb = soup.find('tbody')

courses = []

for tr in tb.find_all('tr'):
	for td in tr.find_all('td'):
		item = td.get_text()
		courses.append(item.replace("\r\n", ("")))


def makeNull(x):
	if x == "\xa0" or x == "-":
		x = None
	return x


courses = map(lambda x: makeNull(x), courses)
courses = list(courses)

courses_code = courses[0::6]
courses_name = courses[1::6]
courses_days = courses[2::6]
courses_hours = courses[3::6]
courses_room = courses[4::6]
courses_staff = courses[5::6]

#ONLY RUN THE FOLLOWING IF YOUR DATABASE IS EMPTIED


import mysql.connector


database = mysql.connector.connect(host="localhost",
                                   user="root",
                                   password="passwordHere",
                                   database="studyquestions")

cursor = database.cursor()

for i in range(1,len(courses_code)):
    print(courses_name[i])
    cursor.execute("insert into courses(course_code,course_name,course_prof)"
                        "values (%s,%s,%s)", (courses_code[i],courses_name[i],courses_staff[i]))
database.commit()
