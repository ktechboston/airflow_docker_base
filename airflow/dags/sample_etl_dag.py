from airflow.operators.python_operator import PythonOperator
from airflow.models import DAG
from datetime import datetime, timedelta
import airflow
import os
import time


'''
Example ETL dag
'''

def pull_data_from_ga():
    time.sleep(240)


def download_log_files():
    time.sleep(120)

def download_csv_data():
    time.sleep(200)

def clean_csv_data():
    time.sleep(10)

def upload_to_s3():
    time.sleep(25)

def load_into_redshift():
    time.sleep(35)


default_args = {
    'owner': 'komodo',
    'start_date': airflow.utils.dates.days_ago(1)
}


dag = DAG(
    dag_id='ETL_example',
    default_args=default_args,
    schedule_interval='0 * * * *',
    max_active_runs=1
  )


ga_dl = PythonOperator(
            task_id='download_ga_data',
            python_callable=pull_data_from_ga,
            dag=dag
    )

log_dl = PythonOperator(
            task_id='download_log_files',
            python_callable=download_log_files,
            dag=dag
    )

csv_dl = PythonOperator(
            task_id='download_csvs',
            python_callable=download_csv_data,
            dag=dag
    )

csv_transform = PythonOperator(
            task_id='clean_csv_data',
            python_callable=clean_csv_data,
            dag=dag
    )

s3_upload = PythonOperator(
            task_id='s3_upload',
            python_callable=upload_to_s3,
            dag=dag
    )

redshift_load = PythonOperator(
            task_id='redshift_load',
            python_callable=load_into_redshift,
            dag=dag
    )

ga_dl.set_downsteam(s3_upload)
log_dl.set_downsteam(s3_uploads)
csv_dl.set_downsteam(csv_transform)
csv_transform.set_downsteam(s3_upload)
s3_upload.set_downsteam(redshift_load)