FROM python:3.7.0-slim
MAINTAINER Marton Papp <marton.papp@emarsys.com>
RUN apt-get -y update && apt-get -y install libpq-dev build-essential less
RUN pip install pgcli
ADD run-pgcli.sh /bin/run-pgcli.sh
ENV PAGER=less
ENV LESS="-SRXF"
ENTRYPOINT ["run-pgcli.sh"]

