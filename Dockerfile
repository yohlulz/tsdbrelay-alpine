FROM frolvlad/alpine-glibc:alpine-3.6
MAINTAINER Ovidiu Maja<ovi.dan89@gmail.com>

ENV VERSION 0.5.0
ENV BASE_LOCATION /opt/tsdb/relay

RUN apk --update add \
	ca-certificates \
	openssl

RUN mkdir -p ${BASE_LOCATION} \
   && wget https://github.com/bosun-monitor/bosun/releases/download/${VERSION}/tsdbrelay-linux-amd64 -P ${BASE_LOCATION} \
   && ln -s ${BASE_LOCATION}/tsdbrelay-linux-amd64 ${BASE_LOCATION}/tsdbrelay \
   && chmod +x ${BASE_LOCATION}/tsdbrelay-linux-amd64

ENV PATH=${BASE_LOCATION}:${PATH}

EXPOSE 4242





