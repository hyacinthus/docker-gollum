FROM ruby

RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*

RUN gem install gollum
RUN gem install github-markdown

VOLUME /wiki
WORKDIR /wiki

EXPOSE 4567

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]

CMD ["gollum"]