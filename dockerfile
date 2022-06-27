FROM ruby:3.1.2

RUN apt-get update

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install

CMD rm /var/app/tmp/pids/server.pid || true
CMD rails s -b 0.0.0.0