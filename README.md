# Sehir-Study-Questions

Website similar to Kaggle made for my University using Python and MySQL

## How To Use :

For MySQL:

1. Open MySQL and make a schema with the name "studyquestions"
2. Open the SQL file "allTables" and exectue it.

For Python:

3. Make sure you change the host,user, and password parameters in here, to whatever you put in your MySQL Database
```python
database = mysql.connector.connect(host="localhost",
                                   user="userHere",
                                   password="passwordHere",
                                   database="studyquestions")
 ```

4. **DO THE PREVIOUS STEP IN BOTH "scrapper.py" and "main.py"**

5. Run scrapper.py, and wait for it to fill the Courses Table in the Database

6. Run main.py and enjoy the website :)
