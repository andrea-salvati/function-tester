import streamlit as st
from jinja2 import Template
import re
import string
import snowflake.connector
import pandas as pd
import support_functions as sp
import os
from streamlit_ace import st_ace

# set the layout to wide
st.set_page_config(layout="wide")

# set the title for the app
col1, mid, col2 = st.columns([1,3,20])
with col1:
    st.image('logos/dazn_logo_w.png', width=150)
with col2:
    st.title("Function Tester")

file_list = os.listdir('funcion_tester_app/functions/')
file_list = [file.replace('.sql','') for file in file_list]

option = st.selectbox(
     'Please select the function you would like to test',file_list)

st.write('This is the code for the function ' + option)

# read the function
with open('funcion_tester_app/functions' + "/" + option + ".sql", 'r') as jinja_file:
    jinja_func = jinja_file.read()

# Spawn a new Ace editor
content = st_ace(language='sql', theme='twilight', value=jinja_func)

# cast the function to string and clean it
clean_function = content.split('\n')[2:][:-2]
str_func = ' '.join(clean_function)

# isolate the arguments of the function
args = re.findall(r"{{ (.*?) }}", str_func)
args = list(dict.fromkeys(args))

st.write('The arguments of the function are:')

args_input = {}

for arg in args:
    arg_input = st.text_input(arg)
    args_input[arg] = arg_input

run = st.button('🏃 Run')

if run == True:
    # connect to snowflake
    ctx = sp.ctx_connect()

    # render jinja template
    jinja_func_temp = Template(str_func)
    # define the functions
    jinja_func_final = jinja_func_temp.render(args_input)
    #final clean
    jinja_func_final = jinja_func_final.replace('"',"'").replace('IS NOT NULL', "<> ''").replace('IS NULL', "= ''").replace('NULL', "''")

    # run the function
    result = sp.run_query('SELECT ' + jinja_func_final, ctx)

    st.write('the result of the function is: ')
    st.dataframe(result)