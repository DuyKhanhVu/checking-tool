FROM python:3.10

ENV FLASK_ENV production
ENV FLASK_APP /src/backend/server.py

RUN apt-get update && \
    apt-get install -y python-dev libldap2-dev libsasl2-dev libssl-dev && \
    pip install pipenv

RUN mkdir /src/
WORKDIR /src

COPY . .
RUN pipenv install --system --deploy

EXPOSE 5000
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
