FROM python:3.8-slim
ARG EMONCMS_WEB_DIR
ARG EMONCMS_DIR
ARG EMONHUB_DIR
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]