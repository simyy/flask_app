FROM python:alpine

COPY app /home/

#RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" >> /etc/apk/repositories
#RUN echo "http://mirrors.aliyun.com/alpine/v3.4/community/" >> /etc/apk/repositories

RUN echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v3.4/main/" >> /etc/apk/repositories
RUN echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v3.4/community/" >> /etc/apk/repositories


RUN apk --update upgrade
#RUN apk add --no-cache --virtual .build-deps gcc musl-dev
RUN apk add gcc musl-dev
RUN apk add libevent
RUN apk add libffi-dev
RUN apk add openssl-dev

RUN pip install -U setuptools
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple cython
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple cython werkzeug flask flask_script flask_migrate gevent pymysql

EXPOSE 4000

WORKDIR /home/
CMD python /home/manage.py runserver
