FROM debian

# initial setup
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed gnupg
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ jessie main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update

# install python
RUN apt-get -y install python python3 python-pip python3-pip python-dev curl

RUN mkdir /app && mkdir /django

RUN pip install --upgrade setuptools
RUN python3 -m pip install Django
COPY contrib /django
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

#Download and extract Signal Sciences Python module into app directory
RUN wget "https://dl.signalsciences.net/sigsci-module-python/sigsci-module-python_latest.tar.gz"
RUN tar -xzvf sigsci-module-python_latest.tar.gz -C /django/mysite/mysite --strip-components=1

ENTRYPOINT ["/app/start.sh"]
