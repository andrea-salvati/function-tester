import snowflake.connector
import pandas as pd
import os

def run_query(query, ctx):
    cs=ctx.cursor()
    allrows=cs.execute(query).fetchall()
    # write the results of the query into a pandas dataframe 
    df = pd.DataFrame(allrows)
    df.columns = ['output_value']
    # return the dataframe
    return df

def ctx_connect():
    ctx = snowflake.connector.connect(
        user=os.getenv("T_REX_SNOWFLAKE_LOGIN"),
        password=os.getenv("T_REX_SNOWFLAKE_PASSWORD"),
        account=os.getenv("SNOWFLAKE_HOST"),
        schema=os.getenv("STAGING"),
        database=os.getenv("T_REX_SNOWFLAKE_DATABASE"),
        warehouse=os.getenv("T_REX_SNOWFLAKE_DEFAULT_WAREHOUSE")
        )
    return ctx