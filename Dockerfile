FROM brunneis/python:3.7.0-ubuntu-18.04

RUN apt-get update && apt-get install -y curl build-essential netcat supervisor vim wget libssl-dev libffi-dev postgresql-client gnupg2 git libsnappy-dev unzip unixodbc-dev sqlite3 libsqlite3-dev

COPY ./ /repo/
WORKDIR /repo

RUN ./pants package //airflow_cli
RUN chmod +x /repo/dist/airflow_cli/airflow_cli.pex

ENTRYPOINT ["/repo/dist/airflow_cli/airflow_cli.pex"]
