FROM centos:7

RUN yum install -y sudo vim curl

RUN curl https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz | tar -zxf - -C /usr/sbin/

ENTRYPOINT ["/usr/sbin/sigsci-agent"]