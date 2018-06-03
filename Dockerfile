FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install python3-dev -y \
    && apt-get install build-essential -y\
    && apt-get install python3-pip -y \
    && pip3 install --upgrade pip \
    && mkdir -p airflow/dags \
    && mkdir -p airflow/logs/scheduler \
	&& mkdir -p airflow/plugins 

COPY requirements.txt requirements.txt

COPY airflow.cfg /root/airflow/airflow.cfg

RUN pip3 install -r requirements.txt \
	&& pip install apache-airflow[postgres] \
	&& cd airflow 

RUN export AIRFLOW_HOME=/root/airflow
#	&& airflow initdb 

WORKDIR /root/airflow

COPY airflow.cfg airflow.cfg

RUN  mkdir -p ~/airflow/dags \
    && mkdir -p ~/airflow/logs/scheduler \
	&& mkdir -p ~/airflow/plugins \

ENV AIRFLOW_HOME=/root/airflow
EXPOSE 8080

#CMD airflow scheduler & airflow webserver -p 8080 