FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install python3-dev -y \
    && apt-get install build-essential -y\
    && apt-get install python3-pip -y \
    && pip3 install --upgrade pip \
    && mkdir -p airflow/dags \
    && mkdir -p airflow/logs/scheduler \
	&& mkdir -p airflow/plugins 

WORKDIR /root/airflow

COPY requirements.txt requirements.txt

COPY airflow.cfg airflow/airflow.cfg

RUN pip3 install -r requirements.txt \
	&& pip install apache-airflow[postgres] \
	&& cd airflow \
	&& export AIRFLOW_HOME=~/airflow \
	&& airflow initdb 


EXPOSE 8080

#CMD airflow scheduler & airflow webserver -p 8080 