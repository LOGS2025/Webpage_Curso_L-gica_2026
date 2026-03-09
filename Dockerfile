# syntax=docker/dockerfile:1

FROM python:3.12-slim

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "tests/test_app.py"]
