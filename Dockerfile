# arm raspberry pi
FROM balenalib/raspberry-pi-alpine-python
# x86_64
#FROM python:3.8-alpine

WORKDIR /usr/src/app

RUN adduser --system --no-create-home --shell /usr/sbin/nologin mqtt_exporter
COPY mqtt_exporter.py requirements-frozen.txt ./
RUN pip install --no-cache-dir -r requirements-frozen.txt

USER mqtt_exporter


EXPOSE 9344
ENTRYPOINT [ "/usr/local/bin/python3", "-u", "/usr/src/app/mqtt_exporter.py" ]
