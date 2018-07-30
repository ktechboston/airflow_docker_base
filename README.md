# airflow_install

```bash
docker-compose up --build

#open new terminal
docker exec -it airflow_install_airflow_1 bash
airflow initdb
nohup airflow scheduler &
nohup airflow webserver &
```
Open your webbrowser to 127.0.0.1:8080

