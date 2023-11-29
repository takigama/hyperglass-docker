FROM python:3.8-bullseye

# this is a comment to force build 2

LABEL maintainer="ictn"


RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install -y nodejs yarn redis-server
RUN pip3 install hyperglass
RUN hyperglass setup -d
COPY hyperglass.yaml /root/hyperglass/
COPY devices.yaml /root/hyperglass/

RUN hyperglass build-ui
RUN mkdir /templ/
RUN tar cfz /templ/template.tgz /root/hyperglass/*
RUN rm -rf /root/hyperglass
RUN mkdir /root/hyperglass
COPY startup.sh /
RUN chmod a+x /startup.sh

CMD ["/startup.sh"]
