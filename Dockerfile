FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install python3-dev -y \
    && apt-get install build-essential -y\
    && apt-get install python3-pip -y \
    && apt-get install vim -y \
    && apt-get install host -y \
    && pip3 install --upgrade pip 

COPY requirements.txt /root/requirements.txt

RUN cd /root \
	pip3 install -r requirements.txt \
    && pip install apache-airflow[postgres] 

ENV AIRFLOW_HOME=/root/airflow

WORKDIR /root/airflow 

EXPOSE 8080
