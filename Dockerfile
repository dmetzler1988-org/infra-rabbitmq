FROM rabbitmq:3.11.1-management

ARG TIMEZONE

# Set timezone and reload config
RUN apt-get update && apt-get install -y tzdata
RUN rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
RUN echo ${TIMEZONE} > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get clean

RUN mkdir /var/lib/rabbitmq/logs

RUN rabbitmq-plugins enable rabbitmq_tracing
RUN rabbitmq-plugins enable rabbitmq_prometheus
RUN rabbitmq-plugins enable rabbitmq_shovel rabbitmq_shovel_management
