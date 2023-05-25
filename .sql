import pandas as pd
import sqlite3
df = pd.read_csv('/content/console.csv')

conn = sqlite3.connect('console_data.sqlite')
df.to_sql('console_sold_data',conn,if_exists='replace')
df_consoles = pd.read_sql ("SELECT * FROM console_sold_data",conn)
df_consoles
#^^ All Consoles and their sales through the region and total global sales^^

df_consoles_playstation=pd.read_sql("SELECT * FROM console_sold_data WHERE console LIKE '%PlayStation%'",conn)
df_consoles_playstation
#^^ PlayStation Consoles Region and Global SALES^^

sum_of_ps_consoles=pd.read_sql("SELECT SUM(Global) FROM console_sold_data WHERE console LIKE '%PlayStation%'",conn)
sum_of_ps_consoles
#^^Total sum of All PlayStation Consoles^^

df_consoles_xbox=pd.read_sql("SELECT * FROM console_sold_data WHERE console LIKE '%xbox%'",conn)
df_consoles_xbox
#^^Xbox Consoles Region and Global Sales^^

sum_of_xbox_consoles=pd.read_sql("SELECT SUM(Global) FROM console_sold_data WHERE console LIKE '%xbox%'",conn)
sum_of_xbox_consoles
#^^Total sum of All Xbox Consoles^^
