# airflow_install

Requires docker and docker-compose to be installed on your local machine.

* https://docs.docker.com/install/
* https://docs.docker.com/compose/install/

```bash
docker-compose up --build

#open new terminal
docker exec -it airflow_install_airflow_1 bash
airflow initdb
nohup airflow scheduler &
nohup airflow webserver &
```
Open your webbrowser to 127.0.0.1:8080

