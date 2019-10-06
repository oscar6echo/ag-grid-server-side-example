
import os
import json
import jinja2 as jj

print('start run_build_script_pgsql')

here = os.path.dirname(os.path.abspath(__file__))
path_in = os.path.abspath(os.path.join(here, 'data', 'input-for-tpl.json'))
path_out = os.path.abspath(os.path.join(here, 'data', 'insert-init.pgsql'))

print(f'input loaded from {path_in}')

with open(path_in, 'r', encoding='utf-8') as f:
    data_in = json.loads(f.read())

loader = jj.FileSystemLoader(here)
env = jj.Environment(loader=loader,
                     variable_start_string='{{',
                     variable_end_string='}}',
                     block_start_string='{%',
                     block_end_string='%}')

template_name = 'insert.tpl-pgsql'
template = env.get_template(template_name)
content = template.render(data_in=data_in)

content = os.linesep.join([s for s in content.splitlines() if s.strip()])

with open(path_out, 'w', encoding='utf-8') as f:
    f.write(content)

print(f'output saved to {path_out}')
