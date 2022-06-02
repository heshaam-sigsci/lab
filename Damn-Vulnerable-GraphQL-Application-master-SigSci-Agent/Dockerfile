FROM python:3.7-alpine

LABEL description="Damn Vulnerable GraphQL Application"
LABEL github="https://github.com/dolevf/Damn-Vulnerable-GraphQL-Application"
LABEL maintainers="Dolev Farhi & Connor McKinnon"

ARG TARGET_FOLDER=/opt/dvga
WORKDIR $TARGET_FOLDER/

RUN apk add --update curl

COPY requirements.txt /opt/dvga/
RUN pip install -r requirements.txt

ADD core /opt/dvga/core
ADD db /opt/dvga/db
ADD static /opt/dvga/static
ADD templates /opt/dvga/templates

COPY app.py /opt/dvga
COPY config.py /opt/dvga
COPY setup.py /opt/dvga/
COPY version.py /opt/dvga/

RUN python setup.py

#Signal Sciences - Download sigsci-agent binary and copy over agent.conf
RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvf sigsci-agent_latest.tar.gz
RUN mkdir /app && mkdir /etc/sigsci
COPY agent.conf /etc/sigsci/agent.conf
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 5001/tcp
#CMD ["python3", "app.py"]
ENTRYPOINT ["/app/start.sh"]
