FROM ubuntu:22.04
RUN apt-get update && apt-get install -y wget dnsutils
COPY load-signal.sh .
RUN chmod 744 load-signal.sh
COPY load.sh .
RUN chmod 744 load.sh
