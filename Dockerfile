FROM python:3.12 AS python-build
RUN pip install mysqlclient

FROM python:3.12-slim
COPY --from=python-build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
RUN apt-get update && apt-get install -y libmariadb3 nginx

# 파이썬 모듈 설치 
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Nginx
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Django server
RUN mkdir /app
COPY . /app
WORKDIR /app

# 환경변수 적용 
ENV SECRET_KEY 'jango-insecure-en41i=ku%2bgr@)b@*3y+5)^8h-qrh#j*u0z-wa3q+7b@r)z_s'

COPY run.sh .
RUN chmod +x run.sh
CMD ["./run.sh"]