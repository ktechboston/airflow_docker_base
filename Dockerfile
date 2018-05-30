FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install python3-dev -y \
    && apt-get install build-essential -y\
    && apt-get install python3-pip -y \
    && pip3 install --upgrade pip \
    && mkdir -p airflow/dags


WORKDIR /root/airflow

RUN mkdir -p airflow

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY airflow.cfg airflow.cfg

RUN pip install apache-airflow[postgres]

RUN mkdir -p airflow/dags \
	&& mkdir -p airflow/logs/scheduler \
	&& mkdir -p airflow/plugins \
	&& airflow initdb


EXPOSE 8080

CMD python3