FROM jmangt/alpine-ruby:latest

RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev libxml2-dev libxslt-dev libffi-dev git && \
    echo "gem: --no-document" >> /etc/gemrc && \
    bundle config build.nokogiri --use-system-libraries && \
    gem install rspec cucumber ffi && \
    gem install nokogiri -- --use-system-libraries && \
    apk del build_deps

RUN mkdir -p /opt/src
WORKDIR /opt/src

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]

CMD ["irb"]
