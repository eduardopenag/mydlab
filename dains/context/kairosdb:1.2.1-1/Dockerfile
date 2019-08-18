ARG  VERSION=16.04
FROM ubuntu:${VERSION}

RUN apt-get update && \
      apt-get install software-properties-common -y

RUN apt-get install wget

RUN apt-get install -y default-jre

RUN wget -O ./kairosdb-1.2.1-1.tar.gz \ 
			https://github.com/kairosdb/kairosdb/releases/download/v1.2.1/kairosdb-1.2.1-1.tar.gz

RUN tar -xzf ./kairosdb-1.2.1-1.tar.gz

ADD kairosdb.properties ./kairosdb/kairosdb.properties

ADD run.sh ./kairosdb/bin/run_kairosdb.sh

EXPOSE 4242 8080 2003 2004

RUN ["chmod", "-R", "777", "/kairosdb/bin/"]

ENTRYPOINT ["./kairosdb/bin/run_kairosdb.sh"]


