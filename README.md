# airflow_install

Requires docker and docker-compose to be installed on your local machine.

* https://docs.docker.com/install/
* https://docs.docker.com/compose/install/

Setup:
```bash
docker-compose up --build -d
#open new terminal
docker exec -it airflow_install_airflow_1 bash
python3 make_user.py
```
Open your webbrowser to 127.0.0.1:8080

