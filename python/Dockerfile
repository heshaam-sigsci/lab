FROM debian

# initial setup
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed gnupg
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ jessie main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update

# install
RUN apt-get -y install python python-pip python-dev nginx
RUN apt-get -y install sigsci-agent

RUN mkdir /app && mkdir /flask

RUN pip install --upgrade setuptools
RUN pip install Flask
COPY app /flask
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
RUN mkdir /etc/sigsci
RUN wget "https://dl.signalsciences.net/sigsci-module-python/sigsci-module-python_latest.tar.gz"
RUN tar -xzvf sigsci-module-python_latest.tar.gz -C /flask --strip-components=1
ENTRYPOINT ["/app/start.sh"]
