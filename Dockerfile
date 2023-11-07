FROM python:latest

# set Buffered python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENV VIRTUAL_ENV=/opt/venv

RUN python3 -m venv $VIRTUAL_ENV

#menjalanan env
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

#proses update dependency di sistem operasi/image docker
RUN apt update -y

#setup work dir
RUN mkdir /app

RUN ls /app
WORKDIR /app

#install dependcy
RUN pip install --upgrade pip   

ADD . /app/

RUN pip install -r requirements.txt --no-cache-dir