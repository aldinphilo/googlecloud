FROM python:3.9-alpine
LABEL maintainer="HAB Technologies"

COPY ./requirements.txt /requirements.txt
COPY ./app /app
WORKDIR /app

RUN python -m venv /py && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home django-user

ENV PATH="/py/bin:$PATH"

USER django-user