# -*- coding: utf-8 -*-
"""
Created on Fri Apr 26 07:43:00 2024

@author: HP
"""

from sqlalchemy import create_engine
import pandas as pd

user = 'root'
password = 'password'
db = 'cement'

engine = create_engine(f"mysql+pymysql://{user}:{password}@localhost/{db}")

df = pd.read_csv(r"C:/Users/HP/Desktop/Project Cement/Data Set for cement/Dataset.csv")

# dumping data into database
df.to_sql('RawMaterial', con = engine, if_exists = 'replace', index = False, chunksize = 1000)

# loading data from database
sql = 'select * from RawMaterial'
RawMaterial = pd.read_sql_query(sql, con = engine)