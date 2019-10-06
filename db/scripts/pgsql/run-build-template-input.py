import os
import json
import pandas as pd
import requests as rq
import datetime as dt


print('start run_build_template_input')

here = os.path.dirname(os.path.abspath(__file__))
url = 'https://raw.githubusercontent.com/ag-grid/ag-grid/master/packages/ag-grid-docs/src/olympicWinners.json'
path_out = os.path.abspath(os.path.join(here, 'data', 'input-for-tpl.json'))


print(f'load input from {url}')
r = rq.get(url)
content = r.json()

df = pd.DataFrame(data=content)
df['date'] = pd.to_datetime(df['date'], format='%d/%m/%Y')
df['date'] = df['date'].map(lambda x: x.isoformat())

mask = df['athlete'] == '' 
df.loc[mask, 'athlete'] = 'team'
df.loc[mask, 'age'] = 100

df['athlete'] = df['athlete'].map(lambda x: x.replace("'", ' '))

content2 = df.to_dict(orient='records')

dic_data = {
    'winners' : content2
}

li_order = ['winners']

dic_out = {
    'data': dic_data,
    'order': li_order
}

with open(path_out, 'w', encoding='utf-8') as f:
    f.write(json.dumps(dic_out))

print(f'output saved to {path_out}')
